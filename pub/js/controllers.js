'use strict';

/* Controllers */

angular.module('ptStats.controllers', ['ptStats.services']).
  controller('ptWhoamICtrl', [ '$scope', 'Base64', '$http', function($scope, $Base64, $http){
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
        var promise = $http.jsonp('https://www.pivotaltracker.com/services/v4/me',
            {
                crossDomain: true,
                dataType: "jsonp",
                withCredentials: true,
                transformResponse: function(data) {
                    var x2js = new X2JS();
                    var json = x2js.xml_str2json( data );
                    return json;
                }
            }
        ).success(function(data, text, xhqr){
            alert(data);
            $scope.person = data;
        });
        console.log(promise);
    };
  }]);
