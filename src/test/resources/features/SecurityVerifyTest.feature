#Scenario 5:
#endpoint = /api/token/verify
#with a valid token you should get response HTTP Status Code 200 and response true
Feature: Token Verify Test

  Background: Setup Test URL
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Verify Valid Token
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "supervisor"
    When method get
    Then status 200
    And print response
    And assert response == "true"

  Scenario: Negative test validate token verify with wrong username
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "WrongUser"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"
    
    #Scenario 7:
  #Endpoint = /api/token/verify
  #with invalid token and valid username should have
  #Status code 400 and error Message "Token Expired or Invalid Token"
  Scenario: Negative test varify Token with invalid token and valid username
		Given path "/api/token/verify"
		And param token = "invalid_token"
		And param username = "supervisor"
		And method get
		Then status 400
		And print response
		And assert response.errorMessage == "Token Expired or Invalid Token"
		
		 Scenario: get account
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/accounts/get-account"
    And header Authorization = "Bearer " + response.token
    #And param token = response.token
    And primaryPersonId  = 6848
    When method get
    Then status 200
    And print response
		
		
