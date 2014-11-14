React = require 'react'

module?.exports = React.createClass
  displayName: 'TalkCommentForm'

  formattedComment: ({title, comment, object}) ->
    {
      title: title
      user: "Current User"
      date: new Date()
      content: comment
    }

  onSubmitComment: (e) ->
    e.preventDefault()
    title = @refs.title.getDOMNode().value.trim()
    comment = @refs.comment.getDOMNode().value.trim()
    object = @refs.object.getDOMNode().value

    console.log "Comment Submitted:", @formattedComment({title, comment, object})

    comment.value = ""

  render: ->
    <div className='talk-comment-form'>
      <form onSubmit={@onSubmitComment}>
        <p>Add to the discussion</p>
        <input ref='title' type='text' placeholder="Post Title (optional)" />

        <select ref='object'>
          <option value=''>Reference an Object</option>
          <option value='object_1'>Object 1</option>
          <option value='object_2'>Object 2</option>
          <option value='object_3'>Object 3</option>
        </select>

        <textarea ref='comment' placeholder="Add a comment" />
        <p><button type='submit'>Submit</button></p>
      </form>
    </div>
