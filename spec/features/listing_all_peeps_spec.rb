require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    Peep.create(:content => "A little peep!")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("A little peep!")
  end
end

