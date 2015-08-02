angular.module 'keranbeandco.common'
.config ($stateProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    controller: 'home'
    templateUrl: 'common/views/home.html'

  .state 'news',
    url: '/news'
    controller: 'news'
    templateUrl: 'common/views/news.html'

  .state 'pictures',
    url: '/pictures'
    controller: 'pictures'
    templateUrl: 'common/views/pictures.html'
