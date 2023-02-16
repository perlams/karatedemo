Feature: Sample for Delete API tests

 Background:
  * url 'https://reqres.in/api'

  Scenario: Test Delete Call

    Given path '/users/2'
    When method Delete
    Then status 204
    And print response

