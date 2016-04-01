class Chitter < Sinatra::Base
  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/chits'
    else
      flash.keep[:details_error] =
      'Incorrect username or password. Check your details or please sign up.'
      redirect '/chits'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thank you and goodbye!'
    redirect '/chits'
  end
end