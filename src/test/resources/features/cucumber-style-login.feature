@ignore
Feature: SELT login
  As a candidate I want to login to my account in order to view my test bookings

  @login
  Scenario: Candidate logs in to SELT
    Given I have a registered candidate username 'gypsy@test.com'
    And my browser is open at URL 'http://localhost:8086/login'
    When I enter username 'gypsy@test.com'
    And I enter password 'Fatfr@g99'
    And I click the login button
    Then my browser navigates to URL 'http://localhost:8086/manage-account'
