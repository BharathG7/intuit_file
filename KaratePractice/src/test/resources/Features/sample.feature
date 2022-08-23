Feature: sample get test

  Scenario: Get api
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status  200
