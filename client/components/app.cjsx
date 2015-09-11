@App = React.createClass
  render: ->
    <div className="app">
      <h1>FitnessKPI</h1>
      <div>
        {this.props.children}
      </div>
    </div>
