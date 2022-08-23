Feature: Get method response

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: print Get api
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseHeaders
    And print responseStatus

  #we can also print responseStatus,responseTime,responseCookies
  # using GET with background
  Scenario: print Get api with background
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  #using GET with background,path and params
  Scenario: print Get api with param,path
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #using GET with Assertions
  #we can use $ in the place of response
  Scenario: print Get api with param,path
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[2].id == 9
    And assert response.data[4].avatar == 'https://reqres.in/img/faces/11-image.jpg'
    And match $.data[5].first_name == 'Rachel'
