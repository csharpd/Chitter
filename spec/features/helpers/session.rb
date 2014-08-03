module SessionHelpers

    def sign_up(name = "chloe", username ="csharpd", email = "chloe@gmail.com", password = "frogs")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end


  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

end
