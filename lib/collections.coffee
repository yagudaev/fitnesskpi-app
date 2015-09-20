addCreatedAt = (userId, doc) ->
  doc.createdAt = Date.now()

addUpdatedAt = (userId, doc) ->
  doc.updatedAt = Date.now()

@WorkoutsCollection = new Mongo.Collection("workouts")
@WorkoutsCollection.before.insert addCreatedAt
@WorkoutsCollection.before.update addUpdatedAt

@ExercisesCollection = new Mongo.Collection("exercises")
@ExercisesCollection.before.insert addCreatedAt
@ExercisesCollection.before.update addUpdatedAt

@SetsHistoryCollection = new Mongo.Collection("sets_history")
@SetsHistoryCollection.before.insert addCreatedAt
@SetsHistoryCollection.before.update addUpdatedAt



# workouts = [{
#   _id: 1
#   title: "A: Chest + Back",
#   exercises: [{
#     _id: 1
#     title: "Chest bench press"
#     setsHistory: [
#       {
#         _id: 1,
#         sets: [
#           {weight: 450, reps: 10}
#         ],
#         notes: ""
#       }
#     ]
#   }]
# }]
