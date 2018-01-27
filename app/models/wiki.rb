class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  def make_public!
    update_attribute(:private, false)
  end
end
