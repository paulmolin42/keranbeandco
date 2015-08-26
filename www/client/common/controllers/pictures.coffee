angular.module 'keranbeandco.common'
.controller 'pictures', ($scope, Upload, File) ->

  $scope.loading = false

  $scope.uploadPicture = () ->
    $scope.loading = true
    Upload.upload
      url: 'api/Files/upload'
      file: $scope.file
    .success ->
      $scope.loading = false
    .error () ->
      $scope.loading = false

  getPictures = () ->
    File.find()
    .$promise
    .then (res) ->
      $scope.pictures = res

  getPictures()
