React = require 'react'
Link = require '../lib/link'
projectBoards = require '../mock-data/project-talk-boards'

module?.exports = React.createClass
  displayName: 'TalkBoardList'

  boardLinkHref: (boardName) ->
    {owner, name} = @props.route.params
    '/projects/' + owner + "/" + name + '/talk/' + boardName

  boardLink: (board, i) ->
    <div key={i} className="talk-board-link">
      <Link href={@boardLinkHref(board.name)}>{board.name}</Link>
      <p>
        Latest Post: <span>{board.latestPost.title} </span>
        by: <span>{board.latestPost.author} </span>
        at: <span>{board.latestPost.date} </span>
      </p>
    </div>

  render: ->
    boardLinks = projectBoards.map(@boardLink)

    <div className='talk-board-list'>
      {boardLinks}
    </div>
