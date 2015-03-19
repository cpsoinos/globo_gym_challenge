require 'pry'
require 'rspec'
require 'capybara/rspec'
require 'factory_girl'

require_relative '../app.rb'

set :environment, :test
set :database, :test

FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions

Capybara.app = Sinatra::Application
