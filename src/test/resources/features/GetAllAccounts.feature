@Regression
Feature: Get All Acounts

Background: All Accounts
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    
Scenario: All accounts
		* def dataGenerator = Java.type('api.data.GenerateData')
    * def emailAddressData = dataGenerator.getEmail()
    Given path "api/accounts/get-all-accounts"
    And header Authorization = "Bearer " + generatedToken
    When method Get
    Then status 200