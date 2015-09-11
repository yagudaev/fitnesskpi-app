Link = ReactRouter.Link

@WorkoutsPage = React.createClass
  mixins: [ReactMeteorData]

  getMeteorData: ->
    workouts: WorkoutsCollection.find({}).fetch()

  getInitialState: -> {}

  addItem: (e) ->
    e.preventDefault()
    workout = React.findDOMNode(@refs.input).value

    WorkoutsCollection.insert(title: workout, exercises: [])
    React.findDOMNode(@refs.input).value = ""

  removeItem: (workout) ->
    (e) ->
      e.preventDefault()
      WorkoutsCollection.remove(workout._id)

  renderWorkoutItems: ->
    for workout in @data.workouts
      <li className="workout-item">
        <Link to="/workouts/#{workout._id}">{workout.title}</Link>
        <a href="#" onClick={@removeItem(workout)}>(delete)</a>
      </li>

  render: ->
    <div className="workout-page">
      <h2>Workouts</h2>
      <ul className="workout-list">
        {@renderWorkoutItems()}
      </ul>
      <form onSubmit={@addItem}>
        <input type="text" ref="input"/>
        <button type="submit">Add Workout</button>
      </form>
    </div>
