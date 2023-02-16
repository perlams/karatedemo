#Author: Perla Munoz

Feature: Sample for Get API tests

  Background:
    * url 'https://reqres.in/api'

  Scenario: Test Single User Call

    Given path '/users/2'
    When method Get
    Then status 200
    And print response
    #Response content validation
    And match  response.data.email contains 'janet.weaver@reqres.in'
    And match response.data.id != 0
    And match response.data.first_name == "Janet"
    And match response.support.text contains 'To keep ReqRes free'
    #Schema Validation
    And match response.data == '#object'
    And match response.data ==
    """
    {
		"id": "#number",
		"email": "#string",
		"first_name": "#string",
		"last_name": "#string",
		"avatar": "#string"
	}
    """

@smoke
  Scenario: Test List Users Call

    Given path '/users?page=2'
    When method Get
    Then status 200
    And print response
   #Response content validation
    And match response.data[0].name == 'cerulean'
    And match response.total != 0
   #Schema vallidation
   And match each response.data ==
    """
    {
		"id": "#number",
		"name": "#string",
		"year": "#number",
		"color": "#string",
		"pantone_value": "#string"
	}
    """


@demo
  Scenario: Test Single User Not Found

    Given path '/users/23'
    When method Get
    Then status 404

