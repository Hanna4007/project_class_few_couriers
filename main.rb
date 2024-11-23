#!/home/hanna/.rbenv/shims/ruby
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspec'
end

require_relative './courier.rb'
require_relative './operator.rb'
require_relative './direction.rb'
puts "Enter the number of couriers"
count = gets
@couriers = []
(0...count.to_i).each do
	@couriers << Courier.new
end
@operator = Operator.new(@couriers)
@direction = Direction.new
directions = @direction.get_direction_from_file
@operator.directions_to_position(directions)
@operator.deliver
puts @operator.result


