require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do
  scenario "when previously not logged in" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    click_link "Sign up"
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome")
    expect(User.first.email).to eq("chloe@gmail.com")
  end

  scenario "with a password that doesn't match" do
    expect { sign_up('chloe','csharpd','chloe@gmail.com', 'frogs', 'fail') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with a email that is already taken" do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  scenario "with a username that is already taken but a different email address" do
    expect { sign_up("chloe","csharpd","chloe@gmail.com","frogs","frogs") }.to change(User, :count).by(1)
    expect { sign_up("chloe","csharpd","chloecoder@gmail.com","frogs") }.to change(User, :count).by(0)
    expect(page).to have_content("That username is already taken")
  end
end


feature "User signs in" do

  before(:each) do
    User.create(:name => "xxx", :username => "xoxo", :email => "test@test.com",
      :password => 'test', :password_confirmation => 'test'
      )
  end

  scenario "with correct information" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    click_link "Sign in"
    sign_in('test@test.com','test')
    expect(page).to have_content("Welcome, test@test.com")
  end

  scenario "with incorrect information" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    click_link "Sign in"
    sign_in('test@test.com','wrong_password')
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end

feature 'User signs out' do

   before(:each) do
    User.create(:name => "xxx", :username => "xoxo", :email => "test@test.com",
      :password => 'test', :password_confirmation => 'test'
      )
  end

    scenario 'while being signed in' do
      sign_in('test@test.com','test')
      click_button "Sign out"
      expect(page).to have_content("Good bye!")
      expect(page).not_to have_content("Welcome, test@test.com")
  end
end