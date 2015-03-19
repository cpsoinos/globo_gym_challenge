class UsersLocation < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :location_id, presence: true

  belongs_to :user
  belongs_to :location
end

# LocationMembership
# validates :user_id, uniqueness: { scope: :location_id }
