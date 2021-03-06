class Boardwalk.Views.DefaultLayout extends Backbone.View
  id: 'container'

  events:
    'click #home': "rootURL"
    'click #login': "loginURL"
    'click #about, #dismiss-modal, #site-veil': 'toggleAbout'

  template: JST['layouts/default']

  render: ->
    @$el.html @template()
    this

  rootURL: (e) ->
    e.preventDefault()
    Backbone.history.navigate('/', true)

  loginURL: (e) ->
    e.preventDefault()
    Backbone.history.navigate('/login', true)

  toggleAbout: (e) ->
    e.preventDefault()
    $('#site-veil, .about.modal').fadeToggle()
