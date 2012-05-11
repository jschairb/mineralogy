require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), "..", "lib", "mineralogy")

RSpec.configure do |conf|
end
