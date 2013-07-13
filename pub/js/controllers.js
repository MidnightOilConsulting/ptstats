'use strict';

/* Controllers */

angular.module('ptStats.controllers', ['ptStats.services']).
  controller('ptWhoamICtrl', [ '$scope', '$http', function($scope, $http){
    $scope.person = {};
    $scope.identify = function(){
        $scope.username = angular.element('#username').val();
        $scope.password = angular.element('#password').val();

        if( $scope.username == '' || $scope.password == '' ) { return; }

        $http.post('/corsproxy.php', {url:'https://www.pivotaltracker.com/services/v4/me',username:$scope.username, password:$scope.password},
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
  }]);
