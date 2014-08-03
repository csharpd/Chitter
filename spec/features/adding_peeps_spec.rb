require 'spec_helper'

feature "User adds a new peep" do

   before(:each) do
    User.create(:name => "xxx", :username => "xoxo", :email => "test@test.com",
      :password => 'test',
      )
  end

  scenario "after signing in" do
    expect(Peep.count).to eq(0)
    visit '/'
    sign_in('test@test.com','test')
    add_peep("Hola World")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq("Hola World")
  end

  def add_peep(content)
    within('#new-peep') do
      fill_in 'content', :with => content
      click_button 'Peep!'
    end
  end
end