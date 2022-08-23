Feature: post api sample

  #here we are using "def" keyword for "expectedOutput" variable.
  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application.json'
    * def expectedOutput = read("postResponse.json")

  Scenario: posting sample 1
    Given url 'https://reqres.in/api/users'
    And request {"name" : "bharath","job" : "Qe"}
    When method POST
    Then status 201
    And print response

  #post with background
  Scenario: post with sample 2
    Given path '/users'
    And request {"name":"radha","job" : "Doctor"}
    When method POST
    Then status 201
    And print response

  #post with match response
  Scenario: post with match sample 3
    Given path '/users'
    And request {"name" : "krishna" , "job" : "tester"}
    When method POST
    Then status 201
    And match response == {"createdAt":"#ignore","name":"krishna","id":"#string","job":"tester"}
    And print response

  #post with read response frome a file
  Scenario: post with response sample 4
    Given path '/users'
    And request {"name" : "Nadini" , "job" : "medical"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  #post with read request body from file
  #Scenario: post request from file
  #Given path '/users'
  #And def requestpath= karate.properties['user.dir']
  #And print requestpath
  #And def filepath= requestpath+'/src/test/java/JsonFiles/postRequest.json'
  #And print filepath
  #And def requestBody = read(filepath)
  #And request requestBody
  #When method POST
  #Then status 201
  #And match $ == requestBody
  #And print response
  #Read body data from file and change request values
  Scenario: Post with change values
    Given path '/users'
    And def requestBody = read('PostRequest.json')
    And set requestBody.name = 'darling radha'
    And request requestBody
    When method POST
    Then status 201
    And print response
