React = require 'react'
Link = require '../lib/link'
board = require '../mock-data/project-talk-board'

module?.exports = React.createClass
  displayName: 'TalkBoard'

  threadHref: (id) ->
    {owner, name, board_name} = @props.route.params
    '/projects/' + owner + "/" + name + '/talk/' + board_name + "/" + id

  postLink: (post, i) ->
    <div key={i} className='talk-board-post-link'>
      <Link href={@threadHref(1)}>{post.title}</Link> # dev- hardcoded id...
      <p>by: {post.author} on: {post.date}</p>
    </div>

  render: ->
    posts = board.posts.map(@postLink)

    <div className='talk-board'>
      <h2>{@props.route.params.board_name}</h2>
      {posts}
    </div>
