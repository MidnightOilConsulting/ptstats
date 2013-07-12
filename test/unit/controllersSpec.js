'use strict';

/* jasmine specs for controllers go here */

describe('controllers', function(){
  beforeEach(module('ptStats.controllers'));
    it('should receive two parameters', inject(function() {
        expect(person).not.toBe(null);
//https://www.pivotaltracker.com/help/api?version=v4#retrieve_me
//I want this model to take username and password from form then call [ivotal
//REST api the greate a person object.  this person's token is what will be used for all subsequent
//requests to the api.  to change token just exchange credentials
    }));  
});
