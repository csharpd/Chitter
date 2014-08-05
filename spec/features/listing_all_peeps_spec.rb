require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    user = User.create(:name => "Chloe", :username => "CsharpD", :email => "chloe@test.com",
      :password => 'frogs',
      )
    Peep.create(:content => "A little peep!", :created_at => "2014-08-03 18:40:51", :user_id => user.id)
  }

  it "when opening the home page" do
    visit '/'
    expect(page).to have_content("A little peep!")
    expect(page).to have_content("08/03/14 at 06:40PM")
    expect(page).to have_content("Chloe")
  end

end

