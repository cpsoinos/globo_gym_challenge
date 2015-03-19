configure :development do
  require 'dotenv'
  Dotenv.load

  require 'sinatra/reloader'
  require 'pry'
  require 'faker'

  also_reload 'app/**/*.rb'
end

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  set :views, 'app/views'
end
