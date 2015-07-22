class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    user.present? && (!record.private? || record.user == user || user.admin?)
  end

end