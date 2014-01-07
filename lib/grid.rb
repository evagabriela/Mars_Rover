class Grid
   attr_reader :grid, :height, :width

   def initialize(height, width)
     @grid = Array.new(height + 1) {Array.new(width + 1)}
     @height = height
     @width = width
   end
end