Link = ReactRouter.Link

@HistoryPage = React.createClass
  dispalyName: 'HistoryPage'
  mixins: [ReactMeteorData]

  getMeteorData: ->
    workoutHistory: WorkoutHistory.find({}, order: {createdAt: -1}).fetch()

  formatTime: (seconds) ->
    moment.duration(seconds * 1000).format("HH:mm:ss", trim: false)

  formatDate: (date) ->
    moment(date).format('HH:mm YYYY-MM-DD')

  renderWorkoutItems: ->
    for workout in @data.workoutHistory
      workoutTemplate = Workout.findOne(_id: workout.workoutId)
      <li className="workout-item">{@formatDate(workout.createdAt)} - {workoutTemplate.title} - {@formatTime(workout.duration)}</li>

  render: ->
    <div className="history-page">
      <h2>History</h2>
      <ul className="workout-list">
        {@renderWorkoutItems()}
      </ul>
      <Link to="/">Back</Link>
    </div>
