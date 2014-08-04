post '/peeps' do
  content = params["content"]
  Peep.create(:content => content, :user_id => current_user.id)
  redirect to('/')
end