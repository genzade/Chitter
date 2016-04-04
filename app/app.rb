ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'rubygems'
require 'tilt/erb'
require 'byebug'

require_relative 'data_mapper_setup'
require_relative 'helpers'

require_relative 'server'
require_relative 'controllers/user'
require_relative 'controllers/chits'
require_relative 'controllers/sessions'
require_relative 'controllers/replies'
