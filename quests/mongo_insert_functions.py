# function 2개 만들기(불러오기, 값 도출하기)

#database connect function

def connect() :

    from pymongo import MongoClient

    mongoclient = MongoClient("mongodb://localhost:27017")     # mongoDB에 접속

    database = mongoclient["local"]                            # database 생성 및 연결

    collection = database["fruits_info"]                       # collection에 작업

    return collection


#database insert function

def insert() :
    list_fruits = [
    {"name": "사과", "color": "빨강", "origin": "한국", "price": "2000"},
    {"name": "바나나", "color": "노랑", "origin": "필리핀", "price": "1500"},
    {"name": "포도", "color": "보라", "origin": "미국", "price": "3000"},
    {"name": "오렌지", "color": "주황", "origin": "미국", "price": "2500"}
    ]
    return list_fruits



collection = connect()
list_fruits = insert()



for x in [0,1,2,3] :
    collection.insert_one(list_fruits[x])






    
