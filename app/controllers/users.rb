class Chitter < Sinatra::Base
  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(full_name:             params[:full_name],
                       username:              params[:username],
                       email:                 params[:email],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/chits/index'
    else
      flash.keep[:errors] = user.errors.full_messages
      redirect '/users/new'
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(params[:token])
    user.update(password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      redirect "/sessions/new"
    else
      flash.now[:errors] = user.errors.full_messages
      erb(:'users/reset_password')
    end
  end

  get '/users/recover' do
    erb(:'users/recover')
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendRecoverLink.call(user)
    end
    erb(:'users/acknowledgement')
  end

  get '/users/reset_password' do
    @token = params[:token]
    @user = User.find_by_valid_token(@token)
    if @user
      erb(:'users/reset_password')
    else
      'Your token is invalid'
    end
  end
end
