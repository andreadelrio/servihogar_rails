When /^I select a date range to delete$/ do
  expect(Event.count).to eq(10)
  page.find("#destroy-event-toggle").trigger(:click)
  page.execute_script("$('#start_day2').val('16/3/2015')")
  page.execute_script("$('#shm_2').val('1:00 PM')")
  page.execute_script("$('#end_day2').val('16/3/2015')")
  page.execute_script("$('#ehm_2').val('2:00 PM')")
  click_on("delete-events")
end

Then /^I should only have eight events$/ do
  expect(Event.count).to eq(8)
end
