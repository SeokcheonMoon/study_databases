from pymongo import MongoClient

# mongoDB에 접속 ( 자원에 대한 class)
mongoClient = MongoClient("mongodb://localhost:27017") #해당하는 mongoDB의 주소를 변수에 담아준다.

# database 생성 및 연결
database = mongoClient["local"]

# collection에 작업
collection = database["fruits"]

# insert many 작업 진행
list_fruits = [
    {"name": "사과", "color": "빨강", "origin": "한국", "price": 2000},
    {"name": "바나나", "color": "노랑", "origin": "필리핀", "price": 1500},
    {"name": "포도", "color": "보라", "origin": "미국", "price": 3000},
    {"name": "오렌지", "color": "주황", "origin": "미국", "price": 2500}
]
insert_result = collection.insert_many(list_fruits)

list_inserted_ids = insert_result.inserted_ids

# delete inserted record 작업 진행 by _ids

collection.delete_many({"_id" : list_inserted_ids[0]})

pass
