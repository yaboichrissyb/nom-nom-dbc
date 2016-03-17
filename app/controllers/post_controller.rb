post '/posts' do
  if request.xhr? && logged_in?
    @posts = [Post.create(url: params[:url], title: params[:title], user_id: session[:user_id], votes: 1)]
    erb :'/posts/_new_post', layout: false, locals: {posts: @posts}
  elsif logged_in?
    @posts = [Post.create(url: params[:url], title: params[:title], user_id: session[:user_id], votes: 1)]
    redirect '/'
  else
    redirect '/users/new'
  end
end


get '/posts/:id/vote' do
  redirect '/users/new' if !logged_in?
  if request.xhr? && logged_in?
    @post = Post.find(params[:id])
    @post.votes += 1
    @post.save
    @post.votes.to_s
  elsif logged_in?
    @post = Post.find(params[:id])
    @post.votes += 1
    @post.save
    redirect "/posts/#{params[:id]}"
  else
    redirect '/users/new'
  end
end

post '/posts/:id/comments' do
  if request.xhr? && logged_in?
    @comments = [Comment.create(body: params[:body], user_id: current_user.id, post_id: params[:id], votes: 1)]
    erb :_new_comment, layout: false, locals: {comments: @comments}
  elsif logged_in?
    @comment = Comment.create(body: params[:body], user_id: current_user.id, post_id: params[:id], votes: 1)
    redirect "/posts/#{params[:id]}"
  else
    redirect '/users/new'
  end
end

delete '/posts/:id/delete' do

  if request.xhr? && logged_in?
    @post = Post.find(params[:id])
    @post.destroy
    @post.id.to_s
  elsif logged_in?
    @post = Post.find(params[:id])
    @post.destroy
    redirect "/"
  else
    redirect '/users/new'
  end
end

get '/posts/:method/sort' do

  case params[:method]

  when "new"
    @posts = Post.order(created_at: :desc)
    erb :'/posts/_new_post', layout: false, locals: {posts: @posts}
  when "comments"
    @posts = Post.all.sort{|x,y| y.comment_count <=> x.comment_count}
    erb :'/posts/_new_post', layout: false, locals: {posts: @posts}
  when "popular"
    @posts = Post.order(votes: :desc)
    erb :'/posts/_new_post', layout: false, locals: {posts: @posts}
  end

end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end
