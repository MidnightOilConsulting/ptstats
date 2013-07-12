'use strict';

/* jasmine specs for controllers go here */

describe('controllers', function(){
    describe('ptWhoamICtrl', function(){
        it('should receive two parameters', function() {
            var scope = {},
                ctrl = new ptWhoamICtrl(scope);
            expect(scope.person).not.toBe(null);
//https://www.pivotaltracker.com/help/api?version=v4#retrieve_me
//I want this model to take username and password from form then call [ivotal
//REST api the greate a person object.  this person's token is what will be used for all subsequent
//requests to the api.  to change token just exchange credentials
        });  
    });
});
