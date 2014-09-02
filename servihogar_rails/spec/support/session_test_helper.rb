module SessionTestHelper

  def login(subject)
    request.session[:provider_id] = subject.id if subject.kind_of?(Provider)
  end
end
