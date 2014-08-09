require 'spec_helper'

require_relative 'helpers/session'

include SessionHelpers

feature "Reply" do

  before(:each) { @user = User.create(name: "Oli", email: "oli@gmail.com", username: "olio", password: "eggs", password_confirmation: "eggs")}

  before(:each) { @peep = Peep.create(content: "Q: What do you call a fake noodle? A: An Impasta", user_id: @user_id)}

  scenario 'can be created' do
    # visit '/'
    # sign_in('oli@gmail.com','eggs')
    # fill_in 'reply', with: "Lolz - so funny!"
    # click_on 'Reply'
    Reply.create(message: "Lolz - so funny!", peep_id: @peep.id, user_id: @user_id)
    expect(Reply.count).to eq 1
    expect(page).to have_content("Lolz - so funny!")
  end
end