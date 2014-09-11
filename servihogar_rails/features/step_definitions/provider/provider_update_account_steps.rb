When /^I update my provider category$/ do
  category = Category.first.name
  fill_in('provider[dni]', with: "45818351")
  click_on("submit")
end

Then /^I should have successfully updated my provider information$/ do
  current_path_is provider_path(@provider)
  provider = Provider.find(@provider.id)
  expect(provider.dni).to eq("45818351")
end
