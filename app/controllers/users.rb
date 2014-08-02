get '/users/new' do
  erb :"users/new"
end

post '/users' do
  User.create(:name => params[:name],
    :username => params[:username],
    :email => params[:email],
    :password => params[:password])
  redirect to('/')
end