'use strict';

/* Controllers */

angular.module('ptStats.controllers', ['ptStats.services']).
  controller('ptWhoamICtrl', [ '$scope', 'Base64', function($scope, $Base64){
    $scope.person = {};
    $scope.username = '';
    $scope.password = '';
    $scope.identify = function(){
        //I want to read the form fields and call a rest api
        //curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v4/me
        //substitute the form values make the call and then convert the returned xml into 
        //a person object whose token is used for all subsequent requests.
        $scope.username = angular.element('#username').val();
        $scope.password = angular.element('#password').val();
        if( $scope.username == '' || $scope.password == '' ) { return; }
        var encoded = $Base64.encode($scope.username + ':' + $scope.password);
        $http.defaults.headers.common.Authorization = 'Basic ' + encoded;
        $http({
            method: 'GET', 
            url: 'https://www.pivotaltracker.com/services/v4/me', 
            withCredentials: true
        });
    };
  }]);
