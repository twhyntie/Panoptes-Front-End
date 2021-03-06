React = require 'react'
{Link, RouteHandler} = require 'react-router'
apiClient = window.api = require '../../api/client'
PromiseToSetState = require '../../lib/promise-to-set-state'

ProjectPage = React.createClass
  displayName: 'ProjectPage'

  componentDidMount: ->
    document.documentElement.classList.add 'on-project-page'

  componentWillUnmount: ->
    document.documentElement.classList.remove 'on-project-page'

  render: ->
    <div className="project-page tabbed-content" data-side="top" style={backgroundImage: "url(#{@props.project.background_image})" if @props.project.background_image}>
      <div className="background-darkener"></div>

      <nav className="tabbed-content-tabs">
        <Link to="project-home" params={id: @props.project.id} className="home tabbed-content-tab">
          <h2><img src={@props.project.avatar} className="project-avatar" />{@props.project.display_name}</h2>
        </Link>
        <Link to="project-science-case" params={id: @props.project.id} className="tabbed-content-tab">Science</Link>
        <Link to="project-status" params={id: @props.project.id} className="tabbed-content-tab">Status</Link>
        <Link to="project-team" params={id: @props.project.id} className="tabbed-content-tab">Team</Link>
        <Link to="project-classify" params={id: @props.project.id} className="classify tabbed-content-tab">Classify</Link>
        <Link to="project-talk" params={id: @props.project.id} className="tabbed-content-tab"><i className="fa fa-comments"></i></Link>
      </nav>

      <div className="project-page-content">
        <RouteHandler project={@props.project} />
      </div>
    </div>

module.exports = React.createClass
  displayName: 'ProjectPageContainer'

  mixins: [PromiseToSetState]

  getInitialState: ->
    project: null

  componentDidMount: ->
    @fetchProject @props.params.id

  componentWillReceiveProps: (nextProps) ->
    unless nextProps.params.id is @props.params.id
      @fetchProject nextProps.params.id

  fetchProject: (id) ->
    @promiseToSetState project: apiClient.createType('projects').get id

  render: ->
    if @state.project?.id?
      <ProjectPage project={@state.project} />
    else
      null
