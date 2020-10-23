@ignore
Feature: Common Web driver stup
  As a tester I want to configure my web test features

Scenario: Background setup tasks
  * configure driver = { type: 'chrome', showDriverLog: true }
  * callonce read ('booking-locators.json')
  * def login = read('login.feature')