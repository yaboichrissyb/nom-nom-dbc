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
