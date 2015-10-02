{Router, Route} = ReactRouter
history = ReactRouter.history.useQueries(ReactRouter.history.createHistory)()

@Routes = React.createClass
  render: ->
    <Router history={history}>
      <Route component={App}>
        <Route path="/" component={HomePage} />

        <Route path="/workouts" component={WorkoutsPage} />
        <Route path="/workouts/:id" component={WorkoutPage} />
        <Route path="/workouts/:workoutId/exercises/:exerciseId" component={ExercisePage} />

        <Route path="/history" component={HistoryPage} />
        <Route path="/history/:id" component={WorkoutHistoryPage} />
      </Route>
    </Router>
