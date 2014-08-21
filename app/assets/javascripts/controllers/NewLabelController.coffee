controllers = angular.module('controllers')
controllers.controller("NewLabelController", [ '$scope', '$location', 'LabelsService'
  ($scope, $location, LabelsService)->
    $scope.newLabel = {name: '', description: ''}

    $scope.createLabel =  ->
      LabelsService.createLabel($scope.newLabel)
])