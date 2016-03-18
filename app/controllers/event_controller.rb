post '/events/:id/comments' do
  # @comment = current_user.comments.build(params[:comment])
  @comment = Comment.new(params[:comment])
  @comment.commenter = current_user
  @comment.event = Event.find(params[:id])
  if @comment.save
    @event = Event.find(@comment.event_id)
    redirect "/events/#{@event.id}"
  else
    erb :'/events/show'
  end
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/show'
end
