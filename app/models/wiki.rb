class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user, presence:true
  after_initialize :init

  scope :visible_to, -> (user) {
    if user.admin?
      all
    elsif user.premium?
      where(["private = ? or user_id =?", false, user.id ])
    else
      where(["private = ?", false ])
    end
  }

  def init
    self.private == false if (self.has_attribute? :private) && self.private.nil?
  end

end
