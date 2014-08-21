controllers = angular.module('controllers')
controllers.controller("SideBarController", [ '$scope', '$location'
  ($scope, $location) ->
    $scope.fetchLabels = ->
      $location.path('/labels').search();

    $scope.main = ->
      $location.path('/').search();

])