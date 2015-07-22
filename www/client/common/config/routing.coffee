angular.module 'keranbeandco.common'
.config ($urlRouterProvider, $httpProvider, $compileProvider) ->

  $compileProvider.aHrefSanitizationWhitelist(/^\s*(mailto|tel|http|https):/)

  $urlRouterProvider.otherwise '/'
