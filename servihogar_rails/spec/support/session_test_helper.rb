module SessionTestHelper

  def login(subject)
    request.session[:user_id] = subject.id if subject.kind_of?(User)
    request.session[:provider_id] = subject.id if subject.kind_of?(Provider)
  end

  def current_user
    User.find(request.session[:user_id])
  end
end
