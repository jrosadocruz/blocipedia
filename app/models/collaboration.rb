class Collaboration < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  # https://www.bloc.io/users/jose-rosado-cruz/checkpoints/1048?roadmap_section_id=16
  # http://blog.flatironschool.com/why-you-dont-need-has-and-belongs-to-many/
  # http://blog.teamtreehouse.com/what-is-a-has_many-through-association-in-ruby-on-rails-treehouse-quick-tip
  # https://hackhands.com/building-has_many-model-relationship-form-cocoon/

end