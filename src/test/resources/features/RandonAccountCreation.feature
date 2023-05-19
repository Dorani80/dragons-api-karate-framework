Feature: Random Account Creation

Background: Setup Test Generate Token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    
    scenario: Create Account withRandom Email
    # Call Java and Method Karate
    * df dataGenerator = java.type('api.data.Generatedata')
    * def email = dataGenerate.getemail()
    And print email

