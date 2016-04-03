class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/chits/index'
    else
      flash.keep[:details_error] =
      'Incorrect username or password. Check your details or please sign up.'
      redirect '/chits/index'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thank you and goodbye!'
    redirect '/chits/index'
  end
end