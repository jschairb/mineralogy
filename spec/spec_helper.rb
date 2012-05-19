require 'bundler'

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), "..", "lib", "mineralogy")

RSpec.configure do |conf|
end
