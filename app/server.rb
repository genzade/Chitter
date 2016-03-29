class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :sessions_secret, 'woobly-doobly'
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    redirect '/chits'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end