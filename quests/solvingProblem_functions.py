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
        "answer_number": 1,
        "score": 20
    },
    {
        "question": "Python에서 'Hello, World!'를 출력하는 코드는 무엇인가요?",
        "choices": ["print('Hello, World!')", "console.log('Hello, World!')", "printf('Hello, World!')", "echo 'Hello, World!'"],
        "answer": "print('Hello, World!')",
        "answer_number": 1,
        "score": 20
    },
    {
        "question": "Python의 주석을 나타내는 기호는 무엇인가요?",
        "choices": ["//", "/* */", "#", "--"],
        "answer": "#",
        "answer_number": 3,
        "score": 20
    },
    {
        "question": "Python에서 리스트의 길이를 반환하는 함수는 무엇인가요?",
        "choices": ["size()", "length()", "len()", "sizeof()"],
        "answer": "len()",
        "answer_number": 3,
        "score": 20
    },
    {
        "question": "Python에서 문자열을 숫자로 변환하는 함수는 무엇인가요?",
        "choices": ["str()", "int()", "char()", "float()"],
        "answer": "int()",
        "answer_number": 2,
        "score": 20
    }
]

    return list_quiz

solvingproblem_second = []
collection = connect()
list_quiz = insert()

for number in list_quiz :
    if collection.count_documents(number) == 0 :
        collection.insert_one(number)

def solve() :

    list_find = list(collection.find())
    sum = 0

    for x in range(len(list_find)) : 
        quiz = list_find[x] #quiz = str_question
        print("{}".format(quiz["question"]))

        for j in range(len(quiz["choices"])):
            choice = quiz["choices"][j]
            print(str(j+1)+". "+choice)
        # str_answer = input()
        num_answer = int(input())

        if num_answer == quiz["answer_number"]:
            sum += quiz["score"]
        collection.update_one( { "_id": quiz["_id"] },{ "$set" : {"result" : num_answer}})
    
    print(str(sum) + "점 입니다.")

         
        
    return