'use strict';


// Declare app level module which depends on filters, and services
angular.module('ptStats', ['ptStats.filters', 'ptStats.services', 'ptStats.directives', 'ptStats.controllers']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/users', {templateUrl: 'partials/users.html', controller: 'ptAPICtrl'});
    $routeProvider.when('/sprints', {templateUrl: 'partials/sprints.html', controller: 'ptAPICtrl'});
    $routeProvider.otherwise({redirectTo: '/view1'});
  }]);
