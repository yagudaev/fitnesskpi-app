addCreatedAt = (userId, doc) ->
  doc.createdAt = Date.now()

addUpdatedAt = (userId, doc) ->
  doc.updatedAt = Date.now()

@Workout = new Mongo.Collection("workouts")
@Workout.before.insert addCreatedAt
@Workout.before.update addUpdatedAt

@Exercise = new Mongo.Collection("exercises")
@Exercise.before.insert addCreatedAt
@Exercise.before.update addUpdatedAt

@SetHistory = new Mongo.Collection("set_history")
@SetHistory.before.insert addCreatedAt
@SetHistory.before.update addUpdatedAt

@WorkoutHistory = new Mongo.Collection("workout_history")
@WorkoutHistory.before.insert addCreatedAt
@WorkoutHistory.before.update addUpdatedAt

@ExerciseHistory = new Mongo.Collection("exercise_history")
@ExerciseHistory.before.insert addCreatedAt
@ExerciseHistory.before.update addUpdatedAt

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
