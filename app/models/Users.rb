class Users < ApplicationRecord
  has_secure_password
  validates :username,   uniqueness: true
  def create
    @user = Users.new(params.require(:user).permit(:username,:password))
    session[:user_id] = @user.id
    redirect_to 'game/start'
  end


  def current_user
    Users.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end


end
