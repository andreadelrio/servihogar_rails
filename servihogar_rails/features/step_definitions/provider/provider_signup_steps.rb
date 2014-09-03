When /^(?:|I )submit correct provider information$/ do
  category = Category.first.name
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  select(category, from: 'provider[category_id]')
  fill_in('provider[password]', with: @provider.password)
  fill_in('provider[password_confirmation]', with: @provider.password_confirmation)
  click_on("submit")
end

Then /^I should have successfully created a provider account$/ do
  provider = Provider.find_by_email(@provider.email)
  expect(provider).to be_true
end

When /^I submit mismatched passwords$/ do
  category = Category.first.name
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  fill_in('provider[password]', with: @provider.password)
  fill_in('provider[password_confirmation]', with: "wrongpassword")
  click_on("submit")
end

And /^I should see a passwords don't match error for provider$/ do
  page.should have_content("Confirmación de contraseña no coincide con la contraseña")
end

And /^I should see my provider name$/ do
  page.should have_content(@provider.name)
end

And /^I shouldn't see "Ya has ingresado"$/ do
  expect(page).to have_no_content('Ya has ingresado')
end

When /^I create a new provider account$/ do
  @location = create(:location)
  category = Category.first.name
  fill_in('provider[email]', with: "test@example.com")
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  select(category, from: 'provider[category_id]')
  fill_in('provider[password]', with: "password")
  fill_in('provider[password_confirmation]', with: "password")
  click_on("submit")
end

And /^I am logged out$/ do
  page.driver.remove_cookie("_servihogar_rails_session")
end

And /^I select a location$/ do
  find("#location_#{@location.id}").set(true)
  click_on("Actualizar lugares de trabajo")
end

Then /^I should have added that location$/ do
  expect(Provider.first.locations).to eq([@location])
end
