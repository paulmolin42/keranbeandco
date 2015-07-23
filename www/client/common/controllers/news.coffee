angular.module 'keranbeandco.common'
.controller 'news', ($scope, News) ->

  News.find
    filter:
      include:
        'improvedUser'
  .$promise
  .then (res) ->
    $scope.allNews = res
