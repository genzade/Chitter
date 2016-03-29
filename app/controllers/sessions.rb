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
end