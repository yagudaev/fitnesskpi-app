@Table = React.createClass
  displayName: 'Table'

  propTypes:
    children: React.PropTypes.any
    onAdd: React.PropTypes.func
    onRemove: React.PropTypes.func
    placeholder: React.PropTypes.string

  defaultProps: ->
    placeholder: "add"

  addItem: (e) ->
    e.preventDefault()
    value = @refs.input.getDOMNode().value
    @props.onAdd?(value)
    @refs.input.getDOMNode().value = ""

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
    <ul className="table">
      {@renderChildren()}
      <li className="table-row">
        <form onSubmit={@addItem}>
          <input type="text" ref="input" placeholder={@props.placeholder} />
        </form>
      </li>
    </ul>
