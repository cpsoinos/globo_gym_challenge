class Location < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true

  has_many :users_locations
  has_many :users, through: :users_locations
end
