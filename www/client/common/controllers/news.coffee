angular.module 'keranbeandco.common'
.controller 'news', ($scope, News) ->

  $scope.isAddNewsFormOpen = null
  $scope.newNews = new News

  News.find
    filter:
      include:
        'improvedUser'
      order: 'sentAt DESC'
  .$promise
  .then (res) ->
    $scope.allNews = res

  $scope.toggleAddNewsForm = (forceToggle) ->
    if typeof forceToggle is "undefined"
      $scope.isAddNewsFormOpen = !$scope.isAddNewsFormOpen
    else
      $scope.isAddNewsFormOpen = forceToggle
    if $scope.isAddNewsFormOpen
      $scope.addNewsIconStyle =
        "color": "rgb(244,67,54)"
    else
      $scope.addNewsIconStyle =
        "color": "rgb(63, 81, 181)"

  $scope.toggleAddNewsForm(false)

  $scope.addNews = () ->
    $scope.newNews.sentAt = new Date()
    News.create $scope.newNews
    .$promise
    .then (res) ->
      $scope.allNews.unshift res
      $scope.newNews = new News
      $scope.toggleAddNewsForm(false)
