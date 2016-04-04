class Chitter < Sinatra::Base
  get '/chits/index' do
    @chits = Chit.all.reverse
    erb(:'chits/index')
  end

  post '/chits/chit' do
    chit = Chit.create(chit_text: params[:chit_text],
                       chit_time: Time.now.strftime("%d %b at %H:%M"), 
                       user_id: params[:user_id])
    chit.save
    redirect '/chits/index'
  end
end
