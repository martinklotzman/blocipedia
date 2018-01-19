class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def edit?
    update?
    # user.present? || user.admin?
    # record.public?
  end

  def destroy?
     user.admin?
  end

  def update?
    user.present?
  end
end
