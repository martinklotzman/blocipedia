class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy

  def make_public!
    update_attribute(:private, false)
  end
end
