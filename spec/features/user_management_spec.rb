require 'spec_helper'

# Feature
# In order to use Chitter
# As a Maker
# I want to sign up to the service

feature "User signs up" do
  scenario "when previously not logged in" do
    lambda { sign_up }.should change(User, :count).by(1)
    # expect(page).to have_content("Welcome")
    expect(User.first.email).to eq("chloe@gmail.com")
  end

  scenario "with a email that is already taken" do
    lambda { sign_up }.should change(User, :count).by(1)
    lambda { sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
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