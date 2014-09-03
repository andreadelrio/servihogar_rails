When /^I update my provider information$/ do
  subcategory = Subcategory.first.name
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[second_email]', with: 'second_email@example.com')
  fill_in('provider[first_name]', with: @provider.first_name)
  fill_in('provider[last_name]', with: @provider.last_name)
  select(subcategory, from: 'provider[subcategory_id]')
  select("Lic.", from: 'provider[title]')
  click_on("submit")
end

Then /^I should have successfully updated my provider information$/ do
  current_path_is dashboard_provider_es_path(@provider)
  provider = Provider.find(@provider.id)
  expect(provider.gender).to be_false
  expect(provider.second_email).to eq("second_email@example.com")
end
