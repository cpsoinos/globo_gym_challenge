require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

configure :development, :test do
  require 'pry'
  require 'faker'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  @title = "Globo Gym"
  locations = Location.all

  erb :index, locals: { locations: locations }
end

get '/location/:location_id' do |id|
  location = Location.find_by(id: id)
  members = User.where(locations_id: id)

  erb :location, locals: { location: location,
                           members: members
                         }
end

get '/members/:member_id' do |id|
  member = User.find_by(id: id)

  erb :members, locals: { member: member }
end
