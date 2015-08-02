angular.module 'keranbeandco.common'
.controller 'pictures', ($scope, Upload, Container) ->

  $scope.loading = false

  $scope.uploadPicture = () ->
    $scope.loading = true
    Upload.upload
      url: 'api/containers/images/upload'
      file: $scope.file
    .success ->
      console.log 'YOUHOU'
      $scope.loading = false
    .error (err) ->
      console.log err
      $scope.loading = false

  getPictures = () ->
    Container.getFiles
      container: 'images'
    .$promise
    .then (res) ->
      console.log res
      $scope.pictures = res
    .catch (err) ->
      console.log err

  getPictures()
