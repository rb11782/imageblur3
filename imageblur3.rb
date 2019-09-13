

class Image
 attr_accessor :array

  def initialize(array)
    @array = array
    @y = array.length
    @x = array[0].length
  end

  def output_image
    coordinates = []
    @array.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        print pixel, "  "
        if pixel == 1
        coordinates.push([y, x])
        end
      end
      puts
    end
  end 

  def switch_blur_distance(y, x)
    @array[y -1][x] = 1 unless y == 0
    @array[y +1][x] = 1 unless y >= @y-1
    @array[y][x -1] = 1 unless x == 0
    @array[y][x +1] = 1 unless x >= @x-1
  end

  def value_one
     one = []
      @array.each_with_index do |row, y|
       row.each_with_index do |pixel, x|
        if pixel == 1
        one.push([y, x])
        end
       end
      end
      one
    end

  def switch_corrdinates(iterations)
    iterations.times do 
      final_array_corrdinates_changes = value_one
      final_array_corrdinates_changes.each do |a, b|
        switch_blur_distance(a, b)
      end
    end
  end
end
puts "Manhattan distance of 1"
puts "----"
image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0], 
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])
image.output_image
puts "----", "Blur(1)"
image.switch_corrdinates(1)
image.output_image
puts "----"
puts "----"

puts "Manhattan distance of 2"
puts "----"
image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0], 
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])
image.output_image
puts "----", "Blur(2)"
image.switch_corrdinates(2)
image.output_image
puts "----"
puts "----"

puts "Manhattan distance of 3"
puts "----" "Blur(3)"
image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
  ])
image.output_image
puts "----"
image.switch_corrdinates(3)
image.output_image
puts "----"
puts "----"

