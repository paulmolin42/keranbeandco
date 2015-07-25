angular.module 'keranbeandco.user'
.factory 'currentUser', (ImprovedUser) ->

  currentUser = null

  fetchCurrentUser = (callback) ->
    if currentUser
      callback currentUser
      return
    ImprovedUser.me()
    .$promise
    .then (res) ->
      currentUser = res.currentUser
      callback currentUser

  logout = (callback) ->
    ImprovedUser.logout()
    .$promise
    .then () ->
      currentUser = null
      callback()

  fetchCurrentUser: fetchCurrentUser
  logout: logout
