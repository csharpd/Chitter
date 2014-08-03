require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    Peep.create(:content => "A little peep!", :created_at => "2014-08-03 18:40:51")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("A little peep!")
    expect(page).to have_content("2014-08-03T18:40:51+01:00")
  end

end

