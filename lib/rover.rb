require_relative './grid'


class Rover
   ROTATIONS = ["N", "E", "S", "W"]
   attr_reader :x, :y, :orientation
   attr_accessor :grid
 
   def initialize(x, y, orientation, grid)
     @x = x
     @y = y
     @orientation = orientation
     @grid = grid
   end
  # Need to change so the rover doesnt have arguments so I can use its own state (update code so that orientation is not an argument because rover has its own state)
   def rotate_rover(direction)
     
     direction == "R" ? turn_right : turn_left
   end
 
   def move_to_new_grid(orientation)
     @grid.grid.reverse[@y][@x] = nil
     case orientation
     when "N" 
       increase_y_coordinate
     when "E" 
       increase_x_coordinate
     when "S" 
       decrease_y_coordinate
     when "W" 
       decrease_x_coordinate
     end
   end
 
   def final_position(x,y,orientation)
     @grid.grid.reverse[y][x] = orientation
   end

   def coordinates(x,y,orientation)
    "x: #{@x}, y: #{@y}, orientation: #{@orientation}"
   end

   private
   # the expection is from N to West (see the rotations array above)
   def turn_left
    # p orientation
     if first_element?(ROTATIONS, @orientation)
       @orientation = ROTATIONS[-1]
     else
       @orientation = ROTATIONS[(ROTATIONS.index(@orientation) - 1)] 
     end
   end
 
   def turn_right
     if last_element?(ROTATIONS, @orientation)
       @orientation = ROTATIONS[0]
     else
       @orientation = ROTATIONS[(ROTATIONS.index(@orientation) + 1)] 
     end    
   end

   def decrease_y_coordinate
     raise StandardError, "error, invalid move! coordinates values must be greater than or equal to zero" if @y == 0 
     @y -= 1 if @grid.available?(@x, (@y-1))
   end

   def decrease_x_coordinate
      raise StandardError, "invalid move coordinate values must be greater than or equal to zero" if @x == 0
      @x -= 1 if @grid.available?(@x-1, @y)  
   end

   def increase_y_coordinate
     raise StandardError, "invalid move: coordinate values cannot exceed the grid size" if @y == @grid.height
     @y+=1 if @grid.available?(@x, (@y+1))
   end

   def increase_x_coordinate
     raise StandardError, "invalid move: coordinate values cannot exceed the grid size" if @x == @grid.width
     @x+=1 if @grid.available?(@x+1, @y)
    end

   def last_element?(array, element)
     array.index(element) == (array.length - 1)
    end

   def first_element?(array, element)
     array.index(element) == 0
    end

 end
   
 

 
 # ====>   Old driver code   <======
 # rover = Rover.new(1, 2, "N")
 # move = rover.move("LMLMLMLMM")
 # puts "#{rover.x}, #{rover.y} #{rover.orientation}"
 # p move
 # rover = Rover.new(3, 3, "E")
 # move = rover.move("MMRMMRMRRM")
 # puts "#{rover.x}, #{rover.y} #{rover.orientation}"
 # p move


 # ====> New driver code  <====

 # grid = Grid.new(5,5)
 # rover = Rover.new(5, 5, "N", grid)
 # rover.move_to_new_grid("S")
 # rover.final_position(5, 4, "S")
 # puts "#{rover.x}, #{rover.y} #{rover.orientation}"
 # p rover.grid.grid
 # p "---------"
 # puts "rover 2"
 # rover2 = Rover.new(5, 5, "E", grid)
 # rover2.move_to_new_grid("S")
 # rover.final_position(5, 4, "S")
 # p rover2.grid.grid
 # puts "#{rover.x}, #{rover.y} #{rover.orientation}"

