React = require 'react'

module?.exports = React.createClass
  displayName: 'TalkCommentForm'

  formattedComment: (text) ->
    {
      user: "Current User"
      date: new Date()
      content: text
    }

  onSubmitComment: (e) ->
    e.preventDefault()
    textarea = @refs.comment.getDOMNode()

    console.log "Comment Submitted:", @formattedComment(textarea.value.trim())
    textarea.value = ""

  render: ->
    <div className='talk-comment-form'>
      <form onSubmit={@onSubmitComment}>
        <p>Add to the discussion</p>
        <textarea ref='comment' placeholder="Add a comment" />
        <p><button type='submit'>Submit</button></p>
      </form>
    </div>
