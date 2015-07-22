class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user, presence:true
  after_initialize :init

  # scope :visible_to, -> (user) { user ? all : where(private: false) }
  scope :visible_to, -> (user) { where(["private = ? or user_id =?", false, user.id ]) }
  # scope :visible_to, -> (user) { user ? all : where(["private = ?", false ]) }
  # scope :visible_to, -> (user) { user ? all : where(["private = ?", false ]) }
  # scope :visible_to, -> (user) { where(["private = ? or user_id = ?", false, user.id ]) }
  # scope :visible_to, -> (user) { user ? all : where(private: true) }
  # scope :visible_to, -> (user) { user ? all : where('private=? OR user_id?', false, user) }

  def init
    self.private == false if (self.has_attribute? :private) && self.private.nil?
  end

end
