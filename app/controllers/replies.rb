class Chitter < Sinatra::Base
  post '/create_reply' do
    reply = Reply.create(reply_text: params[:reply_text],
                         reply_time: Time.now.strftime("%d %b at %H:%M"),
                         chit_id: params[:chit_id], 
                         user_id: params[:user_id])
    reply.save
    redirect '/chits'
  end
end