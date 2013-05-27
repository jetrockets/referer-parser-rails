$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rails'
require 'rspec'
require 'referer-parser-rails'

ENV['RAILS_ENV'] = 'test'

require 'factory_girl'
FactoryGirl.find_definitions