### mongoDB functions
insertOne() = db.posts.insertOne({...})
delete : db.posts.deleteMany({...})
find : db.fruits.find({...})
db.posts.updateMany({}, { $inc: { likes: 1 } })


db.fruits_colors.insertMany([{"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "보라"},
{"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "갈색"},
{"fruits_id" : ObjectId("657bf1269d71c94fb84f3c37"), "color" : "노란색"}] ) ; 



db.fruits_colors.find({ : }) ; 
db.fruits_colors.find({ fruits_id : {$eq : ObjectId("657bf1269d71c94fb84f3c37") } }) ; 