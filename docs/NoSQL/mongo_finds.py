from pymongo import MongoClient

# mongoDB에 접속 ( 자원에 대한 class)
mongoClient = MongoClient("mongodb://localhost:27017") #해당하는 mongoDB의 주소를 변수에 담아준다.


# database 생성 및 연결
database = mongoClient["local"]



# collection에 작업
collection = database["posts"]


# insert 작업 진행

documents = collection.find({}, {"_id":1, "title":1, "likes" : 1}) #collcection에 있는 모든 사항을 다 가져옴. 이걸 document에 담음.

list_documents = list (documents)

print("list_documents length : {}". format(len(list_documents)))
for document in documents :  #documents는 collection의 list,   document는 documents의 내용물
    print("documents : {}".format(document))
    pass
pass

# type(documents)
# <class 'pymongo.cursor.Cursor'>
# documents.next()
# {'_id': ObjectId('657a8e08e8...0c94f436'), 'title': 'Post Title 4', 'likes': 105}