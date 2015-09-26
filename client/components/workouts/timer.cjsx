@Timer = React.createClass
  displayName: 'Timer'

  propTypes:
    startedAt: React.PropTypes.number

  defaultProps: ->
    startedAt: moment.utc()

  getInitialState: ->
    elapsedTime: 0

  time: ->
    moment.duration(@state.elapsedTime)

  tick: ->
    elapsedTime = moment.utc() - @props.startedAt
    @setState(elapsedTime: elapsedTime)
    @timeout = setTimeout(@tick, 1000)

  componentWillMount: ->
    @tick()

  componentWillUnmount: ->
    window.clearTimeout(@timeout)

  render: ->
    <div className="timer">
      {@time().format("HH:mm:ss", trim: false)}
    </div>
