class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin? || !record.private?)
  end

  def edit?
    update?
  end

end