React = require 'react'
thread = require '../mock-data/project-talk-thread'
CommentForm = require './comment-form'

module?.exports = React.createClass
  displayName: 'TalkThread'

  comment: (comment, i) ->
    <div className='talk-comment'>
      <p>{comment.user} on: {comment.date}</p>
      <p>{comment.content}</p>
    </div>

  render: ->
    comments = thread.comments.map(@comment)

    <div className='talk-thread'>
      <img src={thread.subject.location} />
      <CommentForm />
      {comments}
    </div>
