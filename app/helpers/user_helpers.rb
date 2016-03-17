helpers do

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end

  def find_and_ensure_user(id)
    user = User.find_by(id: id)
    halt(404, erb(:'404')) if user.nil?
    user.entries
  end

end
