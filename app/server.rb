require 'sinatra'
require 'data_mapper'
require_relative 'data_mapper_setup'

require './app/controllers/application'
require './app/controllers/peeps'
require './app/controllers/users'

require './app/models/peep'
require './app/models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize








