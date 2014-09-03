module SessionSteps
  def login(subject)
    if subject.kind_of?(User)
      visit("/")
      fill_in("email", with: subject.email)
      fill_in("password", with: subject.password)
      click_on("Ingresa")
    elsif subject.kind_of?(Provider)
      visit("/proveedores/unete")
      fill_in("provider_header_email", with: subject.email)
      fill_in("provider_header_password", with: subject.password)
      click_on("provider_login_button")
    end
  end

  def logout
    visit("/")
    click_on("logout")
  end
end
World(SessionSteps)
