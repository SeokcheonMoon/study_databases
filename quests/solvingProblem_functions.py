def connect() :

    from pymongo import MongoClient

    mongoclient = MongoClient("mongodb://localhost:27017")     # mongoDB 접속 설정

    database = mongoclient["local"]                            # 작업 database 설정

    collection = database["solvingProblem"]                       # 작업 collection 설정

    return collection


def insert() :
    list_quiz = [
        {
            "question": "Python의 생성자 함수 이름은 무엇인가요?",
            "choices": ["__init__", "__main__", "__str__", "__del__"],
            "answer": "__init__",
            "score": 20
        },
        {
            "question": "Python에서 'Hello, World!'를 출력하는 코드는 무엇인가요?",
            "choices": ["print('Hello, World!')", "console.log('Hello, World!')", "printf('Hello, World!')", "echo 'Hello, World!'"],
            "answer": "print('Hello, World!')",
            "score": 20
        },
        {
            "question": "Python의 주석을 나타내는 기호는 무엇인가요?",
            "choices": ["//", "/* */", "#", "--"],
            "answer": "#",
            "score": 20
        },
        {
            "question": "Python에서 리스트의 길이를 반환하는 함수는 무엇인가요?",
            "choices": ["size()", "length()", "len()", "sizeof()"],
            "answer": "len()",
            "score": 20
        },
        {
            "question": "Python에서 문자열을 숫자로 변환하는 함수는 무엇인가요?",
            "choices": ["str()", "int()", "char()", "float()"],
            "answer": "int()",
            "score": 20
        }
    ]
    return list_quiz

collection = connect()
list_quiz = insert()

for number in [0,1,2,3,4] :
    collection.insert_one(list_quiz[number])






# ===========================================================================
import solvingProblem_functions

collection = solvingProblem_functions.connect()
list_quiz = solvingProblem_functions.insert()

for number in [0,1,2,3,4] :
    collection.insert_one(list_quiz[number])
    
answer_first = so
