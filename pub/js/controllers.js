'use strict';

/* Controllers */

angular.module('ptStats.controllers', []).
  controller('ptWhoamICtrl', [ '$scope', function($scope){
    $scope.identify = function(username, password){
        //I want to read the form fields and call a rest api
        //curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v4/me
        //substitute the form values make the call and then convert the returned xml into 
        //a user object whose token is used for all subsequent requests.
        //
        //First thing I have to figure out is how to attach this function to the click event of that
        //form.
        alert('username: '+username+'\npassword: '+password);
    };
  }]);
