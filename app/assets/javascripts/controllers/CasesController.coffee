controllers = angular.module('controllers')
controllers.controller("CasesController", [ '$scope', '$route', '$location', 'CasesService'
  ($scope, $route, $location, CasesService)->

    $scope.fetchCasesResult = ->
      $scope.filterId = $route.current.params.filterId
      CasesService.fetchCasesResult({filter_id: $scope.filterId})

    $scope.$on('casesResult', ->
      $scope.cases = CasesService.getCasesResult()
    )

    $scope.addLabel = (caseId, labels) ->
      labelIds = labels.map (label) -> label.id
      $location.path("/cases/#{caseId}/add_label").search({labelIds: labelIds, filterId: $scope.filterId})

    $scope.fetchCasesResult()
])