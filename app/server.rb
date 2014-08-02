env = ENV["RACK_ENV"] || "development"
require 'data_mapper'
require 'sinatra'

require './app/controllers/application'
require './app/controllers/peeps'
require './app/controllers/users'


DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!






