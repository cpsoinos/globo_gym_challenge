class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :email, presence: true
  # validate its a real email

  validates :phone, presence: true
  # validate it has certain digit range

  validates :credit_card, presence: true
  # probably don't want credit card numbers
  # in database, good thinking but would need to be encrypted

  validates :username, presence: true, uniqueness: true
  # could use email for username since emails
  # have to be unique already

  validates :password, presence: true
  # would probably also want a password_confirmation


  has_many :users_locations
  has_many :locations, through: :users_locations
end
