env = ENV["RACK_ENV"] || "development"
require 'data_mapper'
require 'sinatra'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

