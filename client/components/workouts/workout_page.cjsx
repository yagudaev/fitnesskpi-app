Link = ReactRouter.Link
Navigation = ReactRouter.Navigation

@WorkoutPage = React.createClass
  mixins: [ReactMeteorData, Navigation]

  propTypes: ->
    params: React.PropTypes.object.isRequired

  getMeteorData: ->
    workoutHistory: WorkoutHistoryCollection.findOne({workoutId: @props.params.id}, order: {createdAt: -1})
    workout: WorkoutsCollection.findOne({_id: @props.params.id})
    exercises: ExercisesCollection.find({workoutId: @props.params.id}).fetch()

  addItem: (exerciseTitle) ->
    ExercisesCollection.insert title: exerciseTitle, workoutId: @data.workout._id

  removeItem: (exerciseId) ->
    ExercisesCollection.remove(exerciseId)

  finishWorkout: ->
    duration = @refs.timer.time().get('seconds')
    WorkoutHistoryCollection.update @data.workoutHistory._id, $set: {duration: duration}
    @transitionTo('/workouts')

  addSetHistoryItem: (exercise) ->
    (e) =>
      exerciseHistory = ExerciseHistoryCollection.insert workoutHistoryId: @data.workoutHistory._id, exerciseId: exercise._id, notes: ""
      setsHistory = SetHistoryCollection.find(exerciseId: exercise._id).fetch()
      setHistory = _.last(setsHistory)
      unless setHistory
        setHistory = {sets: [{weight: 0, reps: 0}], notes: "", exerciseId: exercise._id, exerciseHistoryId: exerciseHistory._id}
      SetHistoryCollection.insert(_.omit(setHistory, '_id'))

  renderExerciseItems: ->
    return unless @data.exercises
    for exercise, i in @data.exercises
      <li key="exercise-#{exercise._id}" className="exercise-item" dataId={exercise._id}>
        <Link to="/workouts/#{@props.params.id}/exercises/#{exercise._id}" onClick={@addSetHistoryItem(exercise)}>{exercise.title}</Link>
      </li>

  render: ->
    <div className="workout-page">
      <Timer startedAt={@data.workoutHistory.createdAt} ref="timer" />
      <Link to="/workouts">Cancel</Link>
      <h2>{@data.workout.title}</h2>
      <h3>Exercises</h3>
      <Table onAdd={@addItem} onRemove={@removeItem} placeholder="add exercise">
        {@renderExerciseItems()}
      </Table>
      <Button onClick={@finishWorkout}>Finish Workout</Button>
    </div>
