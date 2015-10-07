Link = ReactRouter.Link

@HomePage = React.createClass
  displayName: 'HomePage'

  render: ->
    <div className="home-page">
      <h2>Home</h2>
      <ul className="collection">
        <li className="collection-item">
          <Link to="/workouts">Workouts</Link>
        </li>
        <li className="collection-item">
          <Link to="/history">History</Link>
        </li>
      </ul>
    </div>
