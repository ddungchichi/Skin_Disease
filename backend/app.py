from flask import Flask
from flask_restful import Api
from test import Test
from model.db import db, init_db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://SongNathan:skinfood123@SongNathan.mysql.pythonanywhere-services.com/SongNathan$skin_disease_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# 데이터베이스 초기화
db.init_app(app)  # db 초기화
with app.app_context():  # app context를 명시적으로 설정
    init_db(app)  # 데이터베이스 초기화 함수 (테이블 생성은 이미 되어있고 데이터 삽입도 건너뜀)

# API 리소스 설정
api = Api(app)
api.add_resource(Test, '/test')

if __name__ == '__main__':
    app.run(debug=True)
