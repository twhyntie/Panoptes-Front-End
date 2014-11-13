React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
Board = require './board'
BoardList = require './board-list'
Thread = require './thread'

ProjectTalk = React.createClass
  displayName: 'ProjectTalk'

  render: ->
    <div className="content-container talk project-text-content">
      <h1>{@props.project} Talk</h1>
        <Route path="/projects/:owner/:name/talk" handler={BoardList} />
        <Route path="/projects/:owner/:name/talk/:board_name" handler={Board} />
        <Route path="/projects/:owner/:name/talk/:board_name/:thread_id" handler={Thread} />
    </div>

module?.exports = React.createClass
  displayName: "ProjectTalkPageContainer"

  render: ->
    <ProjectTalk owner={@props.route.params.owner} project={@props.route.params.name} />
