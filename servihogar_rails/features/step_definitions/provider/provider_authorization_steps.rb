When /^I visit another provider's dashboard$/ do
  @another_provider = create(:provider)
  visit("/proveedores/#{ @another_provider.url }/paneldecontrol")
end

When /^I visit another provider's edit page$/ do
  @another_provider = create(:provider)
  visit("/proveedores/#{@another_provider.url}/edit")
end

When /^I visit another provider's fotos page$/ do
  @another_provider = create(:provider)
  visit("/proveedores/#{@another_provider.url}/fotos")
end