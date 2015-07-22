angular.module 'keranbeandco.user'
.controller 'login', ($scope, $state, ImprovedUser) ->

  $scope.login = ->
    ImprovedUser.login
      email: $scope.loginEmail
      password: $scope.loginPassword
    .$promise
    .then () ->
      $state.go 'home'

  $scope.createUser = ->
    ImprovedUser.create
      firstName: $scope.createFirstName
      lastName: $scope.createLastName
      email: $scope.createEmail
      password: $scope.createPassword
