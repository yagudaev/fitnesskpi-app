Link = ReactRouter.Link

@ExercisePage = React.createClass
  dispalyName: 'ExercisePage'
  mixins: [ReactMeteorData]

  propTypes: ->
    params: React.PropTypes.object.isRequired

  getMeteorData: ->
    workout: Workout.findOne(_id: @props.params.workoutId)
    exercise: Exercise.findOne(_id: @props.params.exerciseId)
    setsHistory: _.first(SetHistory.find({exerciseId: @props.params.exerciseId}, sort: { createdAt: -1 }).fetch())

  addSet: (weight, reps) ->
    sets = @data.setsHistory.sets
    sets.push(weight: weight, reps: reps)
    SetHistory.update(@data.setsHistory._id, {$set: { sets: sets}})

  removeSet: (setId) ->
    sets = @data.setsHistory.sets
    sets.splice(setId, 1)
    SetHistory.update(@data.setsHistory._id, {$set: { sets: sets}})

  renderSetItems: ->
    for set, i in @data.setsHistory.sets
      <li key="set-#{i}" className="set-item table-row collection-item dismissable" dataId={i}>{set.weight} x {set.reps}</li>

  render: ->
    <div className="exercise-page">
      <Link to="/workouts/#{@data.workout._id}">Back</Link>
      <h2>{@data.exercise.title}</h2>
      <SetsTable placeholders={["weight", "reps"]} onAdd={@addSet} onRemove={@removeSet}>
        {@renderSetItems()}
      </SetsTable>
    </div>
