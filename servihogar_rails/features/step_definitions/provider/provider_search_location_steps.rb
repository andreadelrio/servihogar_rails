Given /^a new provider$/ do
  @provider = create(:provider)
end

And /^I login as a provider$/ do
  login(@provider)
end
And /^an existing business$/ do
  @business = create(:business)
end

And /^I am on the setup locations page$/ do
  visit_and_assert(set_locations_provider_es_path(@provider))
end

When /^I type the name of the location in the search bar$/ do
  fill_in("business_search", with: @business.commercial_name)
end
