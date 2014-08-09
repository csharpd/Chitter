post '/reply/:peep_id/:user_id' do | peep_id, user_id|
    reply = Reply.new(message: params[:reply], peep_id: peep_id, user_id: user_id)
    if reply.save
      flash[:notice] = "Reply posted :P"
    else
      flash[:error] = ["Reply failed :("]
    end
      redirect to '/'
    end