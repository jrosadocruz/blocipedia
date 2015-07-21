class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_uniqueness_of :username
  validates :name     , presence: true
  validates :lastname , presence: true
  validates :username , presence: true, length: { minimum: 5 }

  has_many :wikis

  def full_name
    name + ' ' + lastname
  end

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

end
