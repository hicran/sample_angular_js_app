angular.module('sample_app').service("CaseFiltersService",[
  '$resource'
  '$rootScope'
  ($resource, $rootScope)->
    caseFilters = []

    fetchCaseFilters: ->
      promise = $resource('/case_filters', { format: 'json' }).query().$promise
      promise.then((result)->
        caseFilters = result
        $rootScope.$broadcast('caseFilters')
      )

    getCaseFilters: ->
      caseFilters
])