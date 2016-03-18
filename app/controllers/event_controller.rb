
get '/events' do
  all_events = Event.order(:start_date)
  @events = all_events.map{|event| event if event.is_in_the_future?}.compact
  erb :'/events/index'
end

get '/events/new' do
  if current_user
    erb :"/events/new"
  else
    @errors = ["You need to be logged in to add an event."]
    erb :'/users/login'
  end
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

get '/events/:id/users/new' do
  @event = Event.find(params[:id])
  erb :'/events/users/new'
end

post '/events/:id/users' do
  @event = Event.find(params[:id])
  @meal = Meal.new(name: params[:name], day: params[:day], description: params[:description])
  @meal.cook = current_user
  if @meal.save
    @event.meals << @meal
    redirect "/events/#{@event.id}"
  else
    @errors = @meal.errors.full_messages
    erb :'/events/users/new'
  end
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

get '/events/:id/users/new' do
  @event = Event.find(params[:id])
  erb :'/events/users/new'
end

post '/events/:id/comments' do
  if logged_in?
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
  else
    @errors = ["You must be logged in to write a comment"]
    erb :'/users/login'
  end
end


get '/events/:id' do
  @event = Event.find(params[:id])
  p @event
  erb :'/events/show'
end
