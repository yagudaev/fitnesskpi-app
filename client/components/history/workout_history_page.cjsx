Link = ReactRouter.Link

@WorkoutHistoryPage = React.createClass
  displayName: 'WorkoutHistory'
  mixins: [ReactMeteorData]

  propTypes: ->
    params: React.PropTypes.object.isRequired

  getMeteorData: ->
    workoutHistory: WorkoutHistory.findOne(_id: @props.params.id)
    exerciseHistory: ExerciseHistory.find(workoutHistoryId: @props.params.id).fetch()

  # TODO: duplicate format date
  formatDate: (date) ->
    moment(date).format('YYYY-MM-DD @ HH:mm')

  renderSets: (exerciseHistory) ->
    setHistory = SetHistory.findOne(exerciseHistoryId: exerciseHistory._id)
    return unless setHistory
    items =
      for set, i in setHistory.sets
        <li key={i} className="set-history-item">{set.weight}x{set.reps}</li>

    <ul className="sets-history-list">
      {items}
    </ul>

  renderExerciseHistoryItems: ->
    console.log(@data.exerciseHistory)
    for exerciseH in @data.exerciseHistory
      exercise = Exercise.findOne(_id: exerciseH.exerciseId)
      <li key={exerciseH._id} className="exercise-history-item">
        <span className="exercise-history-item-title">
          {exercise.title}
        </span>
        {@renderSets(exerciseH)}
      </li>

  render: ->
    <div className="workout-history-page">
      <h2>Workout on {@formatDate(@data.workoutHistory.createdAt)}</h2>
      <ul className="exercise-history-list">
        {@renderExerciseHistoryItems()}
      </ul>
      <Link to="/history">Back</Link>
    </div>
