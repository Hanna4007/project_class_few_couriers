class Direction
  def get_direction_from_file
    File.open('input.txt').read.split('')
  end
end