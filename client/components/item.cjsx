@Items = React.createClass
  mixins: [ReactMeteorData]
  getMeteorData: ->
    items: ItemsCollection.find({}).fetch()

  getInitialState: ->
    {}

  addItem: (e) ->
    e.preventDefault()
    item = React.findDOMNode(@refs.input).value

    ItemsCollection.insert('content': item)
    React.findDOMNode(@refs.input).value = ""

  renderItems: ->
    @data.items.map (item) =>
      <li key={item._id}>{item.content}</li>

  render: ->
    <div>
      <ul>
        {@renderItems()}
      </ul>
      <form onSubmit={@addItem}>
        <input type="text" ref="input"/>
        <button type="submit">Add Item</button>
      </form>
    </div>
