class Chitter < Sinatra::Base
  post '/users' do
    user = User.create(full_name:             params[:full_name],
                       username:              params[:username],
                       email:                 params[:email],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/chits'
    else
      flash.now[:errors] = user.errors.full_messages
      erb(:index)
    end
  end
end