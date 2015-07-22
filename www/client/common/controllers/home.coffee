angular.module 'keranbeandco.common'
.controller 'home', ($scope, $state, ImprovedUser) ->

  ImprovedUser.me()
  .$promise
  .then (res) ->
    $scope.user = res.currentUser

  $scope.logout = () ->
    ImprovedUser.logout()
    .$promise
    .then () ->
      $state.go 'login'
