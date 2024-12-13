from flask_sqlalchemy import SQLAlchemy

# SQLAlchemy 인스턴스 생성
db = SQLAlchemy()

# 모델 정의
class ClassDescription(db.Model):
    __tablename__ = 'class_descriptions'
    id = db.Column(db.Integer, primary_key=True)
    class_name = db.Column(db.String(255), unique=True, nullable=False)
    disease_name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text, nullable=False)

# 데이터베이스 초기화 (테이블 생성은 건너뛰기)
def init_db(app):
    with app.app_context():
        #기존 데이터 삭제 (원하는 경우에만 사용)
        db.session.query(ClassDescription).delete()

        # 새 데이터 추가
        descriptions = [
            {"class_name": "Acne",
            "disease_name": "여드름(Acne)",
            "description": "여드름은 피지와 죽은 피부 세포로 인해 모공이 막히고 염증이 발생하는 피부 질환입니다.\n"
            "스트레스 관리와 충분한 수면이 여드름 완화에 도움이 됩니다. 수면 부족은 피부 재생 기능을 저하시켜 "
            "각질을 축적시키고 염증을 유발할 수 있습니다.\n"
            "추천 음식 : 당근, 시금치, 통곡물"},
            
            {"class_name": "Psoriasis",
            "disease_name": "건선(Psoriasis)",
            "description": "건선은 피부 세포의 과도한 성장으로 인해 비늘 모양의 피부와 붉은 반점이 생기는 염증성 피부 질환입니다.\n"
            "건조함과 각질, 가려움증을 동반할 수 있으며, 꾸준한 관리가 필요합니다.\n"
            "추천 음식 : 항염증 효과가 있는 올리브 오일, 강황, 블루베리"},
            
            {"class_name": "Rosacea",
            "disease_name": "주사(Rosacea)",
            "description": "주사는 얼굴의 코, 볼, 이마 등에 홍반과 발적이 나타나는 만성 피부 질환입니다.\n"
            "자극적인 음식이나 음주, 급격한 온도 변화는 증상을 악화시킬 수 있으므로 주의가 필요합니다.\n"
            "추천 음식 : 항염증 효과가 있는 녹차, 생강, 강황"},
            
            {"class_name": "vitiligo",
            "disease_name": "백반증(Vitiligo)",
            "description": "백반증은 피부의 멜라닌 색소가 결핍되어 흰 반점이 생기는 질환입니다.\n"
            "면역 체계가 색소 세포를 공격하는 것이 주요 원인으로 알려져 있으며, 전문적인 관리가 중요합니다.\n"
            "추천 음식 : 항산화 효과가 있는 브로콜리, 녹차, 비타민 C가 풍부한 과일"}
        ]

        # 새로운 데이터를 삽입
        for desc in descriptions:
            class_desc = ClassDescription(class_name=desc["class_name"], disease_name = desc["disease_name"], description=desc["description"])
            db.session.add(class_desc)

        # 커밋하여 변경사항 저장
        db.session.commit()

        print("Database initialized with new data!")
