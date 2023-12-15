# 투두리스트 목록 정도
# 참여자의 정보
# 참여자가 집어넣는 정보

from pymongo import MongoClient

# mongoDB에 접속 ( 자원에 대한 class)
mongoClient = MongoClient("mongodb://localhost:27017")

# database 생성 및 연결
database = mongoClient["local"]

# collection에 작업
collection_todos_list = database["todos_list"]

todo_list = [
    {"title": "주간 보고서 작성", "description": "팀의 주간 성과와 진행 상황에 대한 보고서를 작성합니다."},
    {"title": "이메일 확인 및 응답", "description": "미처 확인하지 못한 이메일을 확인하고 필요한 이메일에 대해 응답합니다."},
    {"title": "회의 준비", "description": "다가오는 회의에 대해 준비합니다. 주제 연구, 발표 자료 준비 등이 포함될 수 있습니다."},
    {"title": "프로젝트 계획서 수정", "description": "현재 진행 중인 프로젝트의 계획서를 검토하고 필요한 부분을 수정합니다."},
    {"title": "팀 멤버와의 1:1 면담", "description": "팀 멤버와 개별적으로 만나서 그들의 업무 진행 상황, 이슈, 우려사항 등을 논의합니다."}
    ]

collection_todos_list.insert_many(todo_list)

list_find = list(collection_todos_list.find())