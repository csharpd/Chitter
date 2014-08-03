require 'sinatra'
require 'rack-flash'

require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'


enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

helpers do
  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end
end