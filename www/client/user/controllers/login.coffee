angular.module 'keranbeandco.user'
.controller 'login', ($scope, $state, ImprovedUser, $mdToast) ->

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
    .$promise
    .then () ->
      $mdToast.showSimple 'Le compte a été créé, vous pouvez maintenant vous connecter !'
