# TODO: this code is a duplicate of Table and can be generalized to make a table more
# flexible and remove this specialization
@SetsTable = React.createClass
  displayName: 'SetsTable'

  propTypes:
    children: React.PropTypes.any
    onAdd: React.PropTypes.func
    onRemove: React.PropTypes.func
    placeholders: React.PropTypes.array

  defaultProps: ->
    placeholders: ["add 1", "add 2"]

  addItem: (e) ->
    e.preventDefault()
    value1 = @refs.input1.getDOMNode().value
    value2 = @refs.input2.getDOMNode().value
    @props.onAdd(value1, value2)
    @refs.input1.getDOMNode().value = ""
    @refs.input2.getDOMNode().value = ""

  removeItem: (id) ->
    @props.onRemove?(id)

  renderChildren: ->
    for child in @props.children
      el = <Button onClick={@removeItem.bind(@, child.props.dataId)}>(delete)</Button>
      if _.isArray(child.props.children)
        child.props.children.push el
      else
        child = React.cloneElement child, children: [child.props.children, el]

      child

  render: ->
    <ul className="table collection">
      {@renderChildren()}
      <li className="table-row collection-item dismissable">
        <form onSubmit={@addItem}>
          <input type="text" ref="input1" placeholder={@props.placeholders[0]} />
          x
          <input type="text" ref="input2" placeholder={@props.placeholders[1]} />
          <input type="submit" value="Save" />
        </form>
      </li>
    </ul>
