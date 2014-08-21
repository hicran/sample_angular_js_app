angular.module('sample_app').service("LabelsService",['$resource', '$rootScope', '$location'
  ($resource, $rootScope, $location)->
    labels = []

    fetchLabels: ->
      promise = $resource('/labels', { format: 'json' }).query().$promise
      promise.then((result)->
        labels = result
        $rootScope.$broadcast('labels')
      )

    getLabels: ->
      labels

    createLabel: (newLabel) ->
      promise = $resource('/labels', {format: 'json'}).save(newLabel).$promise
      promise.then((result)->
        $location.path('/labels').search()
      )

])