angular.module 'keranbeandco.common'
.config ($httpProvider) ->
  $httpProvider.interceptors.push 'authHttpResponseInterceptor'
