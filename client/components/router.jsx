var {
  Router,
  Route
} = ReactRouter;

const history = ReactRouter.history.useQueries(ReactRouter.history.createHistory)()

Routes = React.createClass({
  getInitialState: function() {
    return {};
  },
  render: function () {
    return (
      <Router history={history}>
        <Route component={App}>
          <Route path="/" component={Items}/>
        </Route>
      </Router>
    );
  }
});
