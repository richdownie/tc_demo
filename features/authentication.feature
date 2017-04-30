@auth
Feature: Authentication Cukes

Scenario: Invalid email
  Given I am on the login page
  And I enter an invalid email
  And I enter a valid password
  When I click the Sign In button
  Then I should see "The email or password you entered is incorrect. Please try again" on the page

Scenario: Invalid passowrd
  Given I am on the login page
  And I enter a valid email
  And I enter an invalid password
  When I click the Sign In button
  Then I should see "The email or password you entered is incorrect. Please try again" on the page
