{Router, Route} = ReactRouter
history = ReactRouter.history.useQueries(ReactRouter.history.createHistory)()

@Routes = React.createClass
  render: ->
    <Router history={history}>
      <Route component={App}>
        <Route path="/" component={Items}/>
      </Route>
    </Router>
