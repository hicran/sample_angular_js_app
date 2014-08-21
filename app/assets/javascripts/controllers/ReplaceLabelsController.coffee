controllers = angular.module('controllers')
controllers.controller("ReplaceLabelsController", [ '$scope', '$route', 'LabelsService', 'CasesService'
  ($scope, $route, LabelsService, CasesService)->

    $scope.fetchLabels = ->
      $scope.labelsToSelect = []
      LabelsService.fetchLabels()

    $scope.$on('labels', ->
      $scope.caseId = $route.current.params.id
      $scope.filterId = $route.current.params.filterId
      labels = LabelsService.getLabels()
      labelIdsAlreadySelected = $route.current.params.labelIds
      $scope.labelsToSelect = labels.map (label) ->
        selected = label.id in labelIdsAlreadySelected
        {id: label.id, name: label.name, selected: selected}
    )

    $scope.addLabel = ->
      labelsToAdd = $scope.labelsToSelect.filter (label) ->
        label.selected
      labelIdsToAdd = labelsToAdd.map (label) ->
        label.id
      CasesService.replaceLabels($scope.caseId, labelIdsToAdd, $scope.filterId)

    $scope.fetchLabels()
])