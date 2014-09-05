When /^I update my provider category$/ do
  category = Category.first.name
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  select(category, from: 'provider[category_id]')
  click_on("submit")
end

When /^I update my provider category$/ do
  current_path_is edit_provider_path(@provider)
  provider = Provider.find(@provider.id)
  expect(provider.gender).to be_false
  expect(provider.second_email).to eq("second_email@example.com")
end
