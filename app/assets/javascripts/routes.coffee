angular.module('sample_app').config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "main/index.html"
      controller: 'MainController'
    ).when('/cases',
      templateUrl: "cases/index.html"
      controller: 'CasesController'
    ).when('/cases/:id/add_label',
      templateUrl: "cases/replace_labels.html"
      controller: 'ReplaceLabelsController'
    ).when('/labels',
      templateUrl: "labels/index.html"
      controller: 'LabelsController'
    ).when('/labels/new',
      templateUrl: "labels/new_label.html"
      controller: 'NewLabelController'
    )
])

controllers = angular.module('controllers',  [])