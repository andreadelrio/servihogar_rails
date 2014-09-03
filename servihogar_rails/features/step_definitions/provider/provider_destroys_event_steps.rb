When /^I cancel my provider unbooked event$/ do
  visit_and_assert(time_administration_provider_es_path(@provider))
  click_on("#{@event.start_time.strftime('%l:%M').strip} - #{@event.end_time.strftime('%l:%M').strip}")
  click_on("Cerrar slot de tiempo")
end

Then /^the event should be cancelled$/ do
  expect(Event.count).to eq(0)
end

When /^I cancel my provider booked event$/ do
  visit_and_assert(time_administration_provider_es_path(@provider))
  click_on("#{@event.start_time.strftime('%l:%M').strip} - #{@event.end_time.strftime('%l:%M').strip}")
  click_on("delete-event")
end

And /^the user should get an email if they have an email$/ do
  expect(last_mailer.to).to eq([@user.email])
end

And /^the reminder should be deleted$/ do
  Timecop.travel(DateTime.now + 2.weeks) do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end

When /^I unbook my provider booked event$/ do
  visit_and_assert(time_administration_provider_es_path(@provider))
  click_on("#{@event.start_time.strftime('%l:%M').strip} - #{@event.end_time.strftime('%l:%M').strip}")
  click_on("unbook-event")
end

Then /^the event should be unbooked$/ do
  event = Event.find(@event.id)
  expect(event.user_id).to be_nil
  expect(event.phone_name).to be_nil
  expect(event.email_phone_name).to be_nil
end
