require 'spec_helper'

require_relative 'helpers/session'

include SessionHelpers

describe Reply do
  before(:each){ @user = User.create(name: "Oli", email: "oli@gmail.com", username: "olio", password: "eggs", password_confirmation: "eggs") }
  before(:each){ @peep = Reply.create(message: "Q: What do you call a fake noodle? A: An Impasta", user_id: @user.id) }

  it 'can be created' do
    Reply.create(message: "Lolz - so funny!", peep_id: @peep.id, user_id: @user.id)
    expect(Reply.count).to eq 1
  end
end