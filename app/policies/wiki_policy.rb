class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    true
    # user.present? || user.admin?
    # record.public?
  end

  def destroy?
    true
  end

  def update?
    true
  end
end
