class Chitter < Sinatra::Base
  post '/create_chits' do
    chit = Chit.create(chit_text: params[:chit_text],
                       chit_time: Time.now.strftime("%d %b at %H:%M"), 
                       user_id: params[:user_id])
    chit.save
    redirect '/chits'
  end

  get '/chits' do
    @chits = Chit.all.reverse
    erb(:chits)
  end

  post '/create_reply' do
    reply = Reply.create(reply_text: params[:reply_text],
                         reply_time: Time.now.strftime("%d %b at %H:%M"),
                         chit_id: params[:chit_id], 
                         user_id: params[:user_id])

    reply.save
    redirect '/chits'
  end
end
