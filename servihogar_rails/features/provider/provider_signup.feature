Feature: provider sign up

  As a provider
  I want to create an account
  So that I can create profile

  Background:
    Given a provider without an account
    And I am on the provider new page

  #Happy Path
  Scenario: submit correct information
    When I submit correct provider information
    Then I should have successfully created a provider account
    And I should see a welcome message and be on the homepage

  #Sad Path
  
  Scenario: passwords don't match
    When I submit mismatched passwords
    Then I should be on the provider signup page
    And I should see a passwords don't match error for provider

  Scenario: didn't pick any locations
    When I don't check any locations
    Then I should be on the provider signup page
    And I should see a missing locations error message
