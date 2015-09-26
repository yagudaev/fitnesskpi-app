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

@SetHistoryCollection = new Mongo.Collection("set_history")
@SetHistoryCollection.before.insert addCreatedAt
@SetHistoryCollection.before.update addUpdatedAt

@WorkoutHistoryCollection = new Mongo.Collection("workout_history")
@WorkoutHistoryCollection.before.insert addCreatedAt
@WorkoutHistoryCollection.before.update addUpdatedAt

@ExerciseHistoryCollection = new Mongo.Collection("exercise_history")
@ExerciseHistoryCollection.before.insert addCreatedAt
@ExerciseHistoryCollection.before.update addUpdatedAt

# workouts = [{
#   _id: 1
#   title: "A: Chest + Back",
#   workoutHistory: [
#     {
#       _id: 1,
#       createdAt: '2015-09-20',
#       exerciseHistory: [
#         {
#           _id: 1,
#           exerciseId: 1,
#           sets: [
#             {weight: 450, reps: 10}
#           ],
#           notes: ""
#         }
#       ],
#       notes: ""
#     }
#   ],
#   exercises: [{
#     _id: 1
#     workoutId: 1,
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
