React = require 'react'

module?.exports = React.createClass
  displayName: 'TalkBoard'

  componentWillMount: ->
    console.table @props.route

  render: ->
    <h2>{@props.route.params.board_name}</h2>
