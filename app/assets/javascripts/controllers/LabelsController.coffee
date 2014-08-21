controllers = angular.module('controllers')
controllers.controller("LabelsController", [ '$scope', '$location', 'LabelsService'
  ($scope, $location, LabelsService)->

    $scope.fetchLabels = ->
      LabelsService.fetchLabels()

    $scope.$on('labels', ->
      $scope.labels = LabelsService.getLabels()
    )

    $scope.newLabel = ->
      $location.path('/labels/new').search()

    $scope.fetchLabels()
])