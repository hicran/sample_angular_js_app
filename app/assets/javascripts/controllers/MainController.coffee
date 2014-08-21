controllers = angular.module('controllers')
controllers.controller("MainController", [ '$scope', '$location', 'CaseFiltersService'
  ($scope, $location, CaseFiltersService)->

    $scope.fetchCaseFilters = ->
      CaseFiltersService.fetchCaseFilters()

    $scope.$on('caseFilters', ->
      $scope.caseFilters = CaseFiltersService.getCaseFilters()
    )

    $scope.filterCases = (filterId) ->
      $location.path('/cases').search({filterId: filterId})

    $scope.fetchCaseFilters()
])