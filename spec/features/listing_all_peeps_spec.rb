require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    User.create(:name => "Chloe", :username => "CsharpD", :email => "chloe@test.com",
      :password => 'frogs',
      )
    Peep.create(:content => "A little peep!", :created_at => "2014-08-03 18:40:51", :user_id => 1)
  }

  scenario "when opening the home page" do
    visit '/'
    click_link "Sign in"
    sign_in('chloe@test.com','frogs')
    expect(page).to have_content("Welcome, chloe@test.com")
    click_button "Peep!"
    expect(page).to have_content("A little peep!")
    expect(page).to have_content("2014-08-03T18:40:51+01:00")
    # expect(page).to have_content("Chloe")
  end

end

