class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def update?
    if !user.present?
      false
    else
      if !record.private?
        true
      elsif record.user == user && user.premium?
        true
      elsif user.admin?
        true
      end
    end
    # user.present? && (record.user == user || user.admin? || !record.private?)
  end

  def edit?
    update?
  end

end