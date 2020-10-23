@ignore
Feature: SELT Candidate Login: Common login process
  As a candidate I want to login to my account

Background:
  * callonce read('web-setup.feature')

Scenario: Candidate login to SELT

  Given driver baseUrl + '/login'
  And input('#username', username)
  And input('#password', password)
  When submit().click("input[name=login]")
  Then waitForUrl(baseUrl + '/manage-account')
  * scroll('div[id=confirmed]')
  * screenshot()