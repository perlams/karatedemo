Feature:  Sample for Put API tests

  Background:
    * url 'https://reqres.in/api'

  Scenario: Test Update Call

    Given path '/users/2'
    And request {"name": "Leia","job": "leader2"}
    When method Put
    Then status 200
    And print response
    And match response.updatedAt != ' '
    And match response.name == 'Leia'

