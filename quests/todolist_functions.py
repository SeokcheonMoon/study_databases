# 투두리스트 목록 정도
# 참여자의 정보
# 참여자가 집어넣는 정보
def todos_list() :
    from pymongo import MongoClient

    # mongoDB에 접속 ( 자원에 대한 class)
    mongoClient = MongoClient("mongodb://localhost:27017")

    # database 생성 및 연결
    database = mongoClient["local"]

    # collection에 작업
    collection_todos_list = database["todos_list"]

    return collection_todos_list

def participants() :
    from pymongo import MongoClient

    # mongoDB에 접속 ( 자원에 대한 class)
    mongoClient = MongoClient("mongodb://localhost:27017")

    # database 생성 및 연결
    database = mongoClient["local"]

    # collection에 작업
    collection_participants = database["participants"]

    return collection_participants

def participants_todos() :
    from pymongo import MongoClient

    # mongoDB에 접속 ( 자원에 대한 class)
    mongoClient = MongoClient("mongodb://localhost:27017")

    # database 생성 및 연결
    database = mongoClient["local"]

    # collection에 작업
    collection_participants_todos = database["participants_todos"]

    return collection_participants_todos

list_todos = [
    {"title": "주간 보고서 작성", "description": "팀의 주간 성과와 진행 상황에 대한 보고서를 작성합니다."},
    {"title": "이메일 확인 및 응답", "description": "미처 확인하지 못한 이메일을 확인하고 필요한 이메일에 대해 응답합니다."},
    {"title": "회의 준비", "description": "다가오는 회의에 대해 준비합니다. 주제 연구, 발표 자료 준비 등이 포함될 수 있습니다."},
    {"title": "프로젝트 계획서 수정", "description": "현재 진행 중인 프로젝트의 계획서를 검토하고 필요한 부분을 수정합니다."},
    {"title": "팀 멤버와의 1:1 면담", "description": "팀 멤버와 개별적으로 만나서 그들의 업무 진행 상황, 이슈, 우려사항 등을 논의합니다."}
    ]
list_participants = [{"user_name":""}]
list_participants_todos = [{"user_id":"" ,"title":"","ending":""}]


collection_todos_list = todos_list()
collection_participants = participants()
collection_participants_todos = participants_todos()

# 정보 주입--------------------------------------------------------------------------------------------------------key
# collection_todos_list.insert_many(list_todos)
# collection_participants.insert_many(list_participants)
# collection_participants_todos.insert_many(list_participants_todos)

list_find = list(collection_todos_list.find())

while True :

    user_name = input("Input Your Name : ")
    print("ToDo List 중 하나 선택 하세요 !")
    collection_participants.insert_one({"user_name": user_name}) #---------------------------------------------------------key
    user_id = collection_participants["_id"]
    

    for number in range(len(list_find)) : 

        print("{}.{}".format(number + 1, list_find[number]["title"]))

    title = input("타이틀 번호 : ")
    ending = input("종료 여부 : ")

    collection_participants_todos.insert_many([{"user_name" : user_name},{"title" : title}, {"ending" : ending }])
 

    if ending == "q" :
        break