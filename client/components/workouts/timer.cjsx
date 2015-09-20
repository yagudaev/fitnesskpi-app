@Timer = React.createClass
  displayName: 'Timer'

  getInitialState: ->
    elapsedTime: 0

  time: ->
    moment.duration(@state.elapsedTime)

  tick: ->
    elapsedTime = moment.utc() - @startedAt
    @setState(elapsedTime: elapsedTime)
    @timeout = setTimeout(@tick, 1000)

  componentWillMount: ->
    @startedAt = moment.utc()
    @tick()

  componentWillUnmount: ->
    window.clearTimeout(@timeout)

  render: ->
    <div className="timer">
      {@time().format("HH:mm:ss", trim: false)}
    </div>
