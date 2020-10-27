Feature: SELT Candidate Activity Booking
  As a candidate I want to book a test activity

  Background:
    Given I have logged in to SELT with username 'gypsy@test.com'

  @wip @activityChoice @Smoke
  Scenario: Candidate chooses to book activity C2
    Given my browser is open at URL 'http://localhost:8086/manage-account'
    And I click book new test
    When I proceed with no special requirements
    And I choose activity 'UKVI Speaking, listening, reading, and writing at level C2'
    Then my browser navigates to URL 'http://localhost:8086/booking?execution=e1s2'

  @book @centreSearch
  Scenario: Candidate searches for a test centre
    Given I have chosen activity 'UKVI Speaking, listening, reading, and writing at level C2'
    When I choose to search in country 'Afghanistan'
    And I enter location search for 'Kabul, Afghanistan'
    And I click search
    Then I am presented with 5 test centres
    