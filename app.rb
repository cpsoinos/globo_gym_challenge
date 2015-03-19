require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'

require_relative 'config/application'

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do
  locations = Location.all

  erb :login, locals: { locations: locations }
end

post '/login' do
  user = User.find_by(email: params[:email])

  if !user.nil?
    flash[:notice] = "Welcome back!"
    session[:user] = User.find_by(email: params[:email])
    redirect '/home'
  else
    flash[:notice] = "Invalid email or password."
    redirect '/'
  end
end

post '/signup' do
  user = User.new(
    name: params[:name], address: params[:address],
    email: params[:email], phone: params[:phone],
    credit_card: params[:credit_card],
    locations_id: params[:locations].to_i,
    password: params[:password]
    )

  if user.save
    flash[:notice] = "You have successfully signed up! Welcome to Globo Gym."
    session[:user] = User.find_by(email: params[:email])
    redirect '/home'
  else
    flash[:notice] = "Oops! Something went wrong. Try again."
    redirect '/'
  end
end

get '/home' do
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
