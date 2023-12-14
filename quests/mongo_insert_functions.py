# function 2개 만들기(connect, insert)

#function 1 : mongo DB에 연결

def connect() :

    from pymongo import MongoClient

    mongoclient = MongoClient("mongodb://localhost:27017")     # mongoDB 접속 설정

    database = mongoclient["local"]                            # 작업 database 설정

    collection = database["fruits_info"]                       # 작업 collection 설정

    return collection


#function 2 : list를 호출

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

# mongo DB(function 1)에 list_fruits(function 2)를 적용.

for number in [0,1,2,3] :
    collection.insert_one(list_fruits[number])






    
