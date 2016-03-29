ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'rubygems'
require 'tilt/erb'
require 'byebug'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/user'
require_relative 'controllers/chits'

class Chitter < Sinatra::Base
  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/chits'
    else
      flash.now[:details_error] =
      'Incorrect username or password. Check your details or please sign up.'
      erb(:index)
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'Thank you and goodbye!'
    erb(:index)
  end

  run! if app_file == 'app/app.rb'
end
