angular.module('sample_app').service("CasesService",['$resource', '$rootScope', '$location'
  ($resource, $rootScope, $location)->
    casesResult = {}

    fetchCasesResult: (extraParams) ->
      promise = $resource('/cases',  $.extend(extraParams, {format: 'json'})).query().$promise
      promise.then((result)->
        casesResult = result
        $rootScope.$broadcast('casesResult')
      )

    getCasesResult: ->
      casesResult

    replaceLabels: (caseId, labelIds, filterId) ->
      promise = $resource("/cases/#{caseId}/replace_labels", {format: 'json', 'label_ids[]': labelIds}).save().$promise
      promise.then((result)->
        $location.path('/cases').search({filterId: filterId})
      )
])