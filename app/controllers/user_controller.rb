get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  p @user
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  p @user
  if @user && @user.authenticate(params[:password])
    session[:user_id]=@user.id
    redirect '/'
  else
    @errors = ["Incorrect Email/Password"]
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.destroy
  redirect '/'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if @user
    erb :'/users/show'
  else
    erb :not_found
  end
end







