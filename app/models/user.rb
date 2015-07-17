class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name     , presence: true
  validates :lastname , presence: true
  validates :username , presence: true, length: { minimum: 5 }
  validates :password , length: { minimum: 8 }
  validates :password_confirmation, presence: true

end
