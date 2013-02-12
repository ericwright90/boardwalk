class Boardwalk.Routers.Users extends Backbone.Router
  routes:
    '': 'new'
    'users': 'index'
    'users/:id': 'show'

  initialize: ->
    @collection = new Boardwalk.Collections.Users()

  index: ->
    @collection.fetch()
    view = new Boardwalk.Views.UsersIndex(collection: @collection)
    view.setTitle "Users"

    Boardwalk.content.html(view.render().el)

  new: ->
    view = new Boardwalk.Views.UsersNew(collection: @collection)
    Boardwalk.content.html(view.render().el)

  show: (id) ->
    user = new Boardwalk.Models.User id: id

    user.fetch
      success: ->
        view = new Boardwalk.Views.UsersShow(model: user)
        view.setTitle(_.string.titleize(user.get('username')))

        Boardwalk.content.html(view.render().el)

