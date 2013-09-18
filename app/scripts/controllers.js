'use strict';

/* Controllers */

angular.module('ptStats.controllers', ['ptStats.services']).
  controller('ptWhoamICtrl', [ '$scope', '$http', function($scope, $http){
    $scope.person = {};
    $scope.identify = function(){
        $scope.username = angular.element('#username').val();
        $scope.password = angular.element('#password').val();

        if( $scope.username == '' || $scope.password == '' ) { return; }

        $http.post('/corsproxy', {url:'https://www.pivotaltracker.com/services/v4/me',username:$scope.username, password:$scope.password},
            {
                transformResponse: function(data) {
                    var x2js = new X2JS();
                    var json = x2js.xml_str2json( data );
                    return json;
                },
            }
        ).success(function(data){
            $scope.person = data.person;
        });
    };

    $scope.getProjects = function(token){
        $http.post('/corsproxy', {url:'http://www.pivotaltracker.com/services/v4/projects', token:token},
            {
                transformResponse: function(data) {
                    var x2js = new X2JS();
                    var json = x2js.xml_str2json( data );
                    return json;
                },
            }
        ).success(function(data){
            $scope.projects = data.projects.project_asArray;
            console.log($scope.projects);
        });
    };

  }]);
