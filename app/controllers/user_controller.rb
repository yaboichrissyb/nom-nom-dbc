get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
  # if @user.save
  # else
  #   @errors = @user.errors.full_text
  # end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id]=@user.id
    redirect '/'
  else
    @errors = ["Incorrect Username/Password"]
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

