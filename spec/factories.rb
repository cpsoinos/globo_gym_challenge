FactoryGirl.define do
  factory :location do
    sequence (:name) { |n| "Gym #{n} slkdfjsdf" }
    sequence (:address) { |n|  "101#{n} broadway, boston sdlfkj" }
  end

  factory :user do
    sequence (:name) { |n| "Gym #{n} slkdfjsdf" }
    sequence (:address) { |n|  "101#{n} broadway, boston sdlfkj" }
    sequence (:email) { |n| "Gym #{n} slkdfjsdf" }
    sequence (:phone) { |n| "Gym #{n} slkdfjsdf" }
    sequence (:credit_card) { |n|  "10010101 #{n}" }
    sequence (:username) { |n|  "10010101 #{n}" }
    sequence (:password) { |n|  "10010101 #{n}" }
    sequence (:locations_id) { |n|  n }
    admin false
  end

  factory :users_location do
    user
    location
  end
end
