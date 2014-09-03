# Feature: provider authorizations

#   Background:
#     Given a logged in provider

#   Scenario: provider can see his dashboard
#     When I am on my provider dashboard page
#     Then I should be on my provider dashboard page

#   Scenario: provider cannot see another's dashboard
#     When I visit another provider's dashboard
#     Then I should be on the homepage

#   Scenario: provider can go to edit page
#     When I am on my provider edit page
#     Then I should be on my provider edit page

#   Scenario: provider cannot go to another's edit page
#     When I visit another provider's edit page
#     Then I should be on the homepage

#   Scenario: provider can go to his 'fotos' page
#     When I am on my provider fotos page
#     Then I should be on my provider fotos page

#   Scenario: provider cannot go to another's 'fotos' page
#     When I visit another provider's fotos page
#     Then I should be on the homepage

#   Scenario: provider can access create events page
#     When I am on my provider time administration page
#     Then I should be on my provider time administration page

#   Scenario: provider can't access another's create events page
#     When I visit another provider's time administration page
#     Then I should be on the homepage

#   Scenario: provider cannot access another provider's event show page
#     When I visit another provider's event show page
#     Then I should not see the provider book events form
