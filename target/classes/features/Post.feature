Feature: Sample for Post API tests

  Background:
    * url 'https://reqres.in/api'


    #Reading test data from csv file
    Scenario Outline: Test read data from csv file
      Given path '/users'
      And eval data = read ('Data.csv')
      And request {"name": '<name>',"job": '<job>', }
      Then print data
      When method Post
      Then status 201
      And print response

      Examples:
      |read ('Data.csv')|


  # Reading test data from Examples table
  Scenario Outline: Test Create Call
    Given path '/users'
    And request {"name": '<name>',"job": '<job>', }
    When method Post
    Then status 201
    And print response
    And match response.createdAt != ' '
    And match response.name == '<name>'

    Examples:
    | name  | job    |
    | Luke  | Pilot  |
    | Leia  | Leader |