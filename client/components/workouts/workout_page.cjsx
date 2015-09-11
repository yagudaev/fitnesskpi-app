Link = ReactRouter.Link

@WorkoutPage = React.createClass
  mixins: [ReactMeteorData]

  propTypes: ->
    id: React.PropTypes.string.isRequired

  getMeteorData: ->
    workout: WorkoutsCollection.findOne({_id: @props.params.id})

  addItem: (e) ->
    e.preventDefault()
    exerciseTitle = React.findDOMNode(@refs.input).value

    exercises = @data.workout.exercises
    exercises.push(title: exerciseTitle, setsHistory: [])
    WorkoutsCollection.update(@data.workout._id, {$set: { exercises: exercises}})
    React.findDOMNode(@refs.input).value = ""

  removeItem: (exercise) ->
    (e) =>
      e.preventDefault()
      exercises = @data.workout.exercises
      exercises = _.reject exercises, (e) -> e._id == exercise._id
      WorkoutsCollection.update(@data.workout._id, {$set: { exercises: exercises}})

  renderExerciseItems: ->
    return unless @data.workout.exercises
    for exercise in @data.workout.exercises
      <li className="exercise-item">
        {exercise.title}
        <a href="#" onClick={@removeItem(exercise)}>(delete)</a>
      </li>

  render: ->
    <div className="workout-page">
      <Link to="/workouts">Back</Link>
      <h2>{@data.workout.title}</h2>
      <h3>Exercises</h3>
      <ul className="exercises-list">
        {@renderExerciseItems()}
        <li className="exercise-item-add">
          <form onSubmit={@addItem}>
            <input type="text" ref="input" placeholder="add exercise" />
          </form>
        </li>
      </ul>
    </div>
