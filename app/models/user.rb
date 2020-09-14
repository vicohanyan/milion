class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def current_user
    Users.find_by(id: session[:"warden.user.user.key"][0])
  end

  def logged_in?
    !current_user.nil?
  end
end
