angular.module 'keranbeandco.common'
.controller 'pictures', ($scope, Upload, Container) ->

  $scope.loading = false

  $scope.uploadPicture = () ->
    $scope.loading = true
    Upload.upload
      url: 'api/containers/images/upload'
      file: $scope.file
    .success ->
      $scope.loading = false
    .error () ->
      $scope.loading = false

  getPictures = () ->
    Container.getFiles
      container: 'images'
    .$promise
    .then (res) ->
      $scope.pictures = res

  getPictures()
