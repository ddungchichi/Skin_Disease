from flask_restful import Resource
from flask import request
from model.db import db, ClassDescription
import torch
import torchvision.transforms as transforms
import torchvision.models as models
from PIL import Image
import os

class Test(Resource):
    def __init__(self):
        # 디바이스 설정 (CUDA 사용 가능 여부 확인)
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

        # ResNet50 모델 불러오기
        self.model = models.resnet50(pretrained=False)  # 사전 학습된 모델 로드하지 않음
        self.model.fc = torch.nn.Linear(self.model.fc.in_features, 4)  # 출력 클래스 수 4으로 변경

        # 모델의 상태_dict 불러오기
        model_path = '/home/SongNathan/mysite/model/ResNet50_final.pth'  # 절대 경로 사용
        # model_path = os.path.join(os.getcwd(), "/home/SongNathan/mysite/model/ResNet50.pth")  # 절대 경로 사용
        try:
            self.state_dict = torch.load(model_path, map_location=self.device)  # 경로 확인 필요
            self.model.load_state_dict(self.state_dict['model_state_dict'])
        except FileNotFoundError:
            raise RuntimeError(f"Model file not found at {model_path}.")
        except KeyError:
            raise RuntimeError("Invalid model state_dict structure.")

        self.model.to(self.device)
        self.model.eval()

        # 클래스 이름 설정 (모델 학습 시 저장된 클래스 이름)
        self.class_names = self.state_dict.get('class_names', [])

        # 이미지 전처리 설정
        self.transform = transforms.Compose([
            transforms.Resize((224, 224)),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
        ])

    def post(self):
        # 이미지 파일을 요청에서 가져오기
        if 'image' not in request.files:
            return {"error": "No image file found in the request."}, 400

        image_file = request.files['image']

        # 이미지 파일을 열고 예외 처리
        try:
            image = Image.open(image_file.stream).convert("RGB")
        except Exception as e:
            return {"error": f"Failed to open image: {str(e)}"}, 400

        # 이미지 전처리 및 모델에 입력
        predict_image = self.transform(image).unsqueeze(0).to(self.device)
        with torch.no_grad():
            output = self.model(predict_image)
            _, predicted = torch.max(output, 1)

        # 예측된 클래스 이름
        if len(self.class_names) > predicted.item():
            predicted_class = self.class_names[predicted.item()]
        else:
            return {"error": "Predicted class index out of range."}, 500

        # 해당 클래스에 대한 설명을 데이터베이스에서 조회
        class_info = ClassDescription.query.filter_by(class_name=predicted_class).first()
        if class_info:
            response = {
                "disease_name": class_info.disease_name,
                "description": class_info.description
            }
        else:
            response = {
                "disease_name": "No Disease Name available",
                "description": "No description available."
            }

        return response, 200
