require 'spec_helper'

feature "User signs up" do
  scenario "when previously not logged in" do
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome")
    expect(User.first.email).to eq("chloe@gmail.com")
  end

  scenario "with a email that is already taken" do
    lambda { sign_up }.should change(User, :count).by(1)
    lambda { sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  scenario "with a username that is already taken but a different email address" do
    lambda { sign_up("chloe","csharpd","chloe@gmail.com","frogs") }.should change(User, :count).by(1)
    lambda { sign_up("chloe","csharpd","chloecoder@gmail.com","frogs") }.should change(User, :count).by(0)
    expect(page).to have_content("That username is already taken")
  end

  def sign_up(name = "chloe", username ="csharpd", email = "chloe@gmail.com", password = "frogs")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end
end


feature "User signs in" do

  before(:each) do
    User.create(:name => "xxx", :username => "xoxo", :email => "test@test.com",
      :password => 'test',
      )
  end

  scenario "with correct information" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    sign_in('test@test.com','test')
    expect(page).to have_content("Welcome, test@test.com")
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end
end



