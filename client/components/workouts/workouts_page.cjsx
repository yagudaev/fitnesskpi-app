Link = ReactRouter.Link

@WorkoutsPage = React.createClass
  mixins: [ReactMeteorData]

  getMeteorData: ->
    workouts: Workout.find({}).fetch()

  getInitialState: -> {}

  addItem: (workoutTitle) ->
    Workout.insert(title: workoutTitle)

  removeItem: (workoutId) ->
    Workout.remove(workoutId)

  addWorkoutHistory: (workout) ->
    (e) =>
      WorkoutHistory.insert(workoutId: workout._id, duration: 0)

  renderWorkoutItems: ->
    for workout in @data.workouts
      <li key="workout-#{workout._id}" className="workout-item" dataId={workout._id}>
        <Link to="/workouts/#{workout._id}" onClick={@addWorkoutHistory(workout)}>{workout.title}</Link>
      </li>

  render: ->
    <div className="workout-page">
      <h2>Workouts</h2>
      <Table placeholder="add workout" onAdd={@addItem} onRemove={@removeItem}>
        {@renderWorkoutItems()}
      </Table>
    </div>
