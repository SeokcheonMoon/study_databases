from pymongo import MongoClient

# mongoDB에 접속 ( 자원에 대한 class)
mongoClient = MongoClient("mongodb://localhost:27017") #해당하는 mongoDB의 주소를 변수에 담아준다.


# database 생성 및 연결
database = mongoClient["local"]



# collection에 작업
collection = database["fruits"]


# insert 작업 진행

mixed_fruit = {"name": "포도", 
            "color": ["보라", "갈색", "노란색"],  # list를 값에 넣을 수 있음.
            "origin": "미국", 
            "price": "3000"}
result = collection.insert_one(mixed_fruit)
pass