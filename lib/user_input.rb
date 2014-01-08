require_relative './navigator'

puts "What would you like to be the size of your grid? (such as height, width => ex: 5,5)"
  dimensions = gets.chomp
  grid_dimensions = dimensions.split(",")
  navigator = Navigator.new
  navigator.select_grid_size(grid_dimensions[0].to_i, grid_dimensions[1].to_i)
  navigator.grid.grid.each_index do |i|
    p navigator.grid.grid[i]
  end

puts "What coordinates would you like to input for the rover (such as x,y,orientation, example 3,3,E)"
  input = gets.chomp
  coordinates = input.split(",")
  navigator.select_rover(coordinates[0].to_i, coordinates[1].to_i, coordinates[2].upcase)

puts "Please enter your directios for the rover (such as you can only use the ltters L for left, R for right and M for move forward (ex. LMRM)"
  directions = gets.chomp
  navigator.direct_rover(directions.upcase)
  puts "-----"
  puts "The final position is: " + navigator.rover.coordinates(navigator.rover.x, navigator.rover.y, navigator.rover.orientation)
  puts "-----"
  navigator.grid.grid.each_index do |i|
    p navigator.grid.grid[i]
  end
  puts "-----"
  puts "Goodbye!"

