'use strict';

/* Controllers */

angular.module('ptStats.controllers', []).
  controller('ptWhoamICtrl', [ '$scope', function($scope){
    $scope.person = {};
    $scope.identify = function(){
        //I want to read the form fields and call a rest api
        //curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v4/me
        //substitute the form values make the call and then convert the returned xml into 
        //a person object whose token is used for all subsequent requests.
        $scope.person.username = angular.element('#username').val();
        $scope.person.password = angular.element('#password').val();
        alert('username: ' + $scope.person.username + '\npassword: ' + $scope.person.password);
    };
  }]);
