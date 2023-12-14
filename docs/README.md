### mongoDB functions
insertOne() = db.posts.insertOne({...})
delete : db.posts.deleteMany({...})
find : db.fruits.find({...})
db.posts.updateMany({}, { $inc: { likes: 1 } })