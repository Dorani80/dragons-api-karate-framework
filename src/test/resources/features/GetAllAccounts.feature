
@Regression

Feature: Get all accounts

Background: API Test Setup
    * def result = callonce read('GetAllAccounts')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get all accounts
    * def dataGenerator = Java.type('api.data.GenerateData')
    * def emailAddressData = dataGenerator.getEmail()
    Given path "/api/accounts/all-accounts"
    And header Authorization = "Bearer " + generatedToken
    And request
[
  {
    "primaryPerson": {
      "id": 0,
      "email": "string",
      "title": "string",
      "firstName": "string",
      "lastName": "string",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "string",
      "dateOfBirth": "2023-05-23T23:27:40.911Z",
      "user": {
        "id": 0,
        "fullName": "string",
        "username": "string",
        "accountType": "CSR",
        "authorities": [
          {
            "id": 0,
            "role": "string",
            "users": [
              "string"
            ]
          }
        ],
        "accountNonExpired": true,
        "accountNonLocked": true,
        "credentialsNonExpired": true,
        "enabled": true,
        "primaryPerson": "string"
      }
    },
    "primaryPersonMailingAddresses": [
      {
        "id": 0,
        "addressType": "string",
        "addressLine1": "string",
        "city": "string",
        "state": "string",
        "postalCode": "string",
        "countryCode": "string",
        "current": true
      }
    ],
    "primaryPersonPhones": [
      {
        "id": 0,
        "phoneNumber": "string",
        "phoneExtension": "string",
        "phoneTime": "string",
        "phoneType": "string"
      }
    ],
    "primaryPersonCars": [
      {
        "id": 0,
        "make": "string",
        "model": "string",
        "year": "string",
        "licensePlate": "string"
      }
    ],
    "plans": [
      {
        "createdBy": "string",
        "createdDate": "2023-05-23T23:27:40.911Z",
        "modifiedBy": "string",
        "modifiedDate": "2023-05-23T23:27:40.911Z",
        "id": 0,
        "primaryPerson": {
          "id": 0,
          "email": "string",
          "title": "string",
          "firstName": "string",
          "lastName": "string",
          "gender": "MALE",
          "maritalStatus": "MARRIED",
          "employmentStatus": "string",
          "dateOfBirth": "2023-05-23T23:27:40.911Z",
          "user": {
            "id": 0,
            "fullName": "string",
            "username": "string",
            "accountType": "CSR",
            "authorities": [
              {
                "id": 0,
                "role": "string",
                "users": [
                  "string"
                ]
              }
            ],
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "primaryPerson": "string"
          }
        },
        "planType": "AUTO",
        "planPrice": 0,
        "effectiveDate": "2023-05-23T23:27:40.911Z",
        "expirationDate": "2023-05-23T23:27:40.911Z",
        "planExpire": true,
        "primaryPersonCar": {
          "id": 0,
          "make": "string",
          "model": "string",
          "year": "string",
          "licensePlate": "string"
        },
        "address": {
          "id": 0,
          "addressType": "string",
          "addressLine1": "string",
          "city": "string",
          "state": "string",
          "postalCode": "string",
          "countryCode": "string",
          "current": true
        },
        "new": true
      }
    ]
  }
