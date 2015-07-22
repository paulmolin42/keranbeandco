angular.module 'keranbeandco.common'
.config ($stateProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    controller: 'home'
    templateUrl: 'common/views/home.html'
