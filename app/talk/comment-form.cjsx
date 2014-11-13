React = require 'react'

module?.exports = React.createClass
  displayName: 'TalkCommentForm'

  onSubmitComment: (e) ->
    e.preventDefault()
    textarea = @refs.comment.getDOMNode()

    console.log "Comment Submitted:", textarea.value
    textarea.value = ""

  render: ->
    <form onSubmit={@onSubmitComment}>
      <p>Add to the discussion</p>
      <textarea ref='comment' placeholder="Add a comment" />
      <p><button type='submit'>Submit</button></p>
    </form>

