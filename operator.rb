class Operator
  def initialize(couriers)
    @couriers=couriers
  end
    
  def directions_to_position(directions)
    @coordinates = directions.filter_map do |element| 
      case element
        when '^'
          [0, 1]
        when 'v'
          [0, -1]
        when '>'
          [1, 0]
        when '<'
          [-1, 0]
        end
    end 
	end

  def current_couriers
    @current_couriers ||= @couriers.cycle
  end
    
  def deliver
    return if @couriers.empty?

    @coordinates.each do |coordinate|     
      delta_x = coordinate[0]
      delta_y = coordinate[1] 
      current_couriers.next.move(delta_x, delta_y)       
    end 
  end    

      
  def result
    @couriers.each.with_index.to_h do |courier, index|
        [index, courier.history]     
    end
  end
end