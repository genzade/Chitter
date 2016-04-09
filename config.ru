require 'rubygems'
require 'dotenv'
require File.join(File.dirname(__FILE__), './app/app.rb')

Dotenv.load

run Chitter