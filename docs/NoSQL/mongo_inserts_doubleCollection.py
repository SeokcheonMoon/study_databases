from pymongo import MongoClient

# mongoDB에 접속 ( 자원에 대한 class)
mongoClient = MongoClient("mongodb://localhost:27017") #해당하는 mongoDB의 주소를 변수에 담아준다.


# database 생성 및 연결
database = mongoClient["local"]



# collection에 작업
collection = database["fruits"]


# insert 작업 진행

mixed_fruit = {"name": "포도",
            "color": ["보라", "갈색", "노란색"],
            "origin": "미국",}

result = collection.insert_one(mixed_fruit)

# 분리 입력(fruits, fruits_colors)
# insert 작업 진행

dict_fruit = {"name": "포도",
            "origin": "미국",}

result = collection.insert_one(dict_fruit)

print("{}".format(result.inserted_id))
inserted_id = result.inserted_id

# insertedId: ObjectId("657bf1269d71c94fb84f3c37")


# insert fruits_colors 작업 진행



# [{"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "보라"},
# {"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "갈색"},
# {"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "노란색"}] #list에 있는 내용들을 dict 모양으로 바꿈.0

fruits_colors = [{"color" : "보라"},
                {"color" : "갈색"},
                {"color" : "노란색"}]

list_fruits_colors = list()

for dict_color in fruits_colors :
    dict_color["fruits_id"] = inserted_id
    list_fruits_colors.append(dict_color)
    pass

# collection fruits_colors

collection_fruits_colors = database["fruits_colors"]
collection_fruits_colors.insert_many(list_fruits_colors)

# find from fruits_colors

# collection_fruits_colors.find({ fruits_id : {$eq : ObjectId("657bf1269d71c94fb84f3c37") } }) ;             ###### 몽고DB에서는 이렇게

documents = collection_fruits_colors.find({ "fruits_id" : {"$eq" : inserted_id } }) ;                        ###### 파이썬에서는 이렇게 바꿔야함.

# db.fruits_colors.find({ fruits_id : {$eq : ObjectId("657bf1269d71c94fb84f3c37") } }) ; 

pass    