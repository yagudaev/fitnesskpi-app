Link = ReactRouter.Link

@WorkoutsPage = React.createClass
  mixins: [ReactMeteorData]

  getMeteorData: ->
    workouts: WorkoutsCollection.find({}).fetch()

  getInitialState: -> {}

  addItem: (workoutTitle) ->
    WorkoutsCollection.insert(title: workoutTitle)

  removeItem: (workoutId) ->
    WorkoutsCollection.remove(workoutId)

  renderWorkoutItems: ->
    for workout in @data.workouts
      <li key="workout-#{workout._id}" className="workout-item" dataId={workout._id}>
        <Link to="/workouts/#{workout._id}">{workout.title}</Link>
      </li>

  render: ->
    <div className="workout-page">
      <h2>Workouts</h2>
      <Table placeholder="add workout" onAdd={@addItem} onRemove={@removeItem}>
        {@renderWorkoutItems()}
      </Table>
    </div>
