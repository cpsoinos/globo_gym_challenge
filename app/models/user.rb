class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :credit_card, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :users_locations
  has_many :locations, through: :users_locations
end
