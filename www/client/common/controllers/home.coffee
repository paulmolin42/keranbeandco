angular.module 'keranbeandco.common'
.controller 'home', ($scope, $state, currentUser) ->

  currentUser.fetchCurrentUser (currentUser) ->
    $scope.user = currentUser

  $scope.logout = () ->
    currentUser.logout ->
      $state.go 'login'
