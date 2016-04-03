class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :sessions_secret, 'woobly-doobly'
  set :partial_template_engine, :erb

  enable :partial_underscores
  helpers Helpers

  get '/' do
    redirect(:'chits/index')
  end
end