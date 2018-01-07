class User < ApplicationRecord
  has_many :wikis

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]
end
