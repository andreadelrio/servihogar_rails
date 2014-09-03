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
    And I should be on my provider set locations page

  Scenario: create account as male
    When I submit correct male provider information
    Then I should have successfully created a provider account as male
    And I should be on my provider set locations page

  @elasticsearch
  Scenario: provider searched locations success
    When I create a new provider account
    And I search for an existing business
    Then I should see the business and its locations

  @elasticsearch
  Scenario: provider selects locations
    When I create a new provider account
    And I search for an existing business
    And I select a location
    Then I should have added that location

  @javascript
  Scenario: provider creates locations
    When I create a new provider account
    And I create locations directly
    Then I should see my new locations

  @javascript
  Scenario: should see errors when commercial name left blank
    When I create a new provider account
    And I submit an empty provider create business form
    Then I should see a commercial name cannot be blank error

  @javascript
  Scenario: should see full form when business commercial name left blank
    When I create a new provider account
    And I submit an empty provider create business form
    And I submit valid provider create business information
    Then I should have successfully created a business

  @javascript
  Scenario: follow link in welcome email while logged out
    When I create a new provider account
    And I am logged out
    And I follow the link in the provider welcome email
    Then I should be on the provider login page
    And I should be on the lugares de trabajo page

  #Sad Path
  Scenario: passwords don't match
    When I submit mismatched passwords
    Then I should be on the provider signup page
    And I should see a passwords don't match error for provider

  Scenario: url has unpermitted characters
    When I submit an invalid URL
    Then I should be on the provider signup page
    And I should see a URL has invalid characters error message
