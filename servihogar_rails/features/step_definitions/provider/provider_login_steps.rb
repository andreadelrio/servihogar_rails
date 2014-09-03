When /^I login with valid provider credentials$/ do
  fill_in('email', with: @provider.email)
  fill_in('password', with:@provider.password)
  click_on("provider_login_button")
end
