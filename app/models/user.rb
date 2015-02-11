class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos
end


# NameError in Devise::RegistrationsController#new
# undefined local variable or method `confirmed_at' for #<User:0x007f98f1413ed0>