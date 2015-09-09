@App = React.createClass
  render: ->
    <div>
      <h1>Meteor-React Demo</h1>
      <div>
        {this.props.children}
      </div>
    </div>
