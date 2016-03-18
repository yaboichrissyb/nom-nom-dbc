
get '/events' do
  all_events = Event.order(:start_date)
  @events = all_events.map{|event| event if event.is_in_the_future?}.compact
  erb :'/events/index'
end

get '/events/new' do
  erb :"/events/new"
end

post '/events' do
  @event = Event.new(params[:event])
  if @event.save
    redirect '/events'
  else
    @errors = @event.errors.full_messages
    erb :'/events/new'
  end
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/show'
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  if current_user.id == @event.creator_id
    erb :'/events/edit'
  else
    redirect '/'
  end
end

put '/events/:id' do
  @event = Event.find(params[:id])
  if @event.update_attributes(params[:event])
    redirect "/"
  else
    @errors = @event.errors.full_messages
    erb :'/events/edit'
  end
end

delete '/events/:id' do
  event = Event.find(params[:id])
  if current_user.id == event.creator_id
    event.destroy
    redirect '/'
  else
    redirect '/'
  end
end

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

get '/events/:id/cooks' do
  @event = Event.find(params[:id])
  erb :'/events/id/cooks/new'
end

