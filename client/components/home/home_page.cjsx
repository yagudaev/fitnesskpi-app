Link = ReactRouter.Link

@HomePage = React.createClass
  displayName: 'HomePage'

  render: ->
    <div className="home-page">
      <h2>Home</h2>
      <ul>
        <li>
          <Link to="/workouts">Workouts</Link>
        </li>
        <li>
          <Link to="/history">History</Link>
        </li>
      </ul>
    </div>
