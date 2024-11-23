class Courier
  def initialize
    @current_x = 0
    @current_y = 0
    @house = {[0, 0] => 1}
  end
     
  def move(delta_x, delta_y)
      @current_x += delta_x
      @current_y += delta_y
      @house[[@current_x, @current_y]] ||=0
      @house[[@current_x, @current_y]]+=1
  end
  
  def history
    @house
  end
end 

