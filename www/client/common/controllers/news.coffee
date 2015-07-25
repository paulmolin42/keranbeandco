angular.module 'keranbeandco.common'
.controller 'news', ($scope, News, currentUser) ->

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

  $scope.toggleAddNewsForm(false)

  $scope.addNews = () ->
    $scope.newNews.sentAt = new Date()
    currentUser.fetchCurrentUser (currentUser) ->
      $scope.newNews.improvedUser = currentUser
      News.create $scope.newNews
      .$promise
      .then (res) ->
        res.improvedUser = currentUser
        $scope.allNews.unshift res
        $scope.newNews = new News
        $scope.toggleAddNewsForm(false)
