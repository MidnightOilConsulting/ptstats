'use strict';

/* Controllers */

angular.module('ptStats.controllers', []).
  controller('ptAPICtrl', [ '$scope', function($scope){
    $scope.users = "Go get the users from the rest api";
  }]);
