angular.module 'keranbeandco.common'
.factory 'authHttpResponseInterceptor', ($q, $injector) ->
  response: (response) ->
    response or $q.when(response)
  responseError: (rejection) ->
    if (rejection.status == 401)
      console.log 'HAHA'
      $injector.get('$state').go 'login'
    $q.reject rejection
