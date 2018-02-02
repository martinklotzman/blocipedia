class User < ApplicationRecord
  has_many :wikis

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]

  def downgrade_user!
    self.role = 0
    self.wikis.update_all(private: false)
    end
    save!
  end
end
