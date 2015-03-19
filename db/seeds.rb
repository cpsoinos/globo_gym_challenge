# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

125.times do
  User.find_or_create_by!(name: Faker::Name.name,
    address: (Faker::Address.street_address + ', ' +
    Faker::Address.city + ', ' + Faker::Address.state_abbr + ' ' +
    Faker::Address.zip), email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    credit_card: Faker::Business.credit_card_number,
    locations_id: rand(1..21), username: Faker::Internet.user_name,
    password: Faker::Internet.password)
end

20.times do
  Location.find_or_create_by!(name: Faker::App.name,
    address: Faker::Address.street_address + ', ' +
    Faker::Address.city + ', ' + Faker::Address.state_abbr + ' ' +
    Faker::Address.zip)
end

