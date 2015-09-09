@App = React.createClass
  render: ->
    <div className="app">
      <h1>Meteor-React Demo</h1>
      <div>
        {this.props.children}
      </div>
    </div>
