require 'sinatra'
require 'rack-flash'

require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'helpers/application'


enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

