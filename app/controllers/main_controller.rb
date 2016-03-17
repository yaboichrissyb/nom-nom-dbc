get '/' do
  @posts = Post.all
  erb :index
end

get '/comments/:id/vote' do
  if request.xhr? && logged_in?
    @comment = Comment.find(params[:id])
    @comment.votes += 1
    @comment.save
    @comment.votes.to_s
  elsif logged_in?
    @comment = Comment.find(params[:id])
    @comment.votes += 1
    @comment.save
    redirect "/posts/#{params[:id]}"
  else
    redirect '/users/new'
  end
end
