require_relative '../operator'

RSpec.describe "operator" do

    let(:courier_1) { Courier.new }
    let(:courier_2) { Courier.new }
    let(:courier_3) { Courier.new }

    let(:operator_1) { Operator.new([courier_1, courier_2]) }
    let(:operator_2) { Operator.new([courier_1, courier_2, courier_3]) }
    let(:operator_3) { Operator.new([]) }
   
    let(:directions_1) { ['^', '>', 'v', '<'] }
    let(:directions_2) { ['^', '>'] }
    let(:directions_3) { ['^', '>', 'n'] }
    let(:directions_4) { [] }

    it 'correct order of couriers' do
      expect(operator_2.current_couriers.next).to eq(courier_1)
      expect(operator_2.current_couriers.next).to eq(courier_2)
      expect(operator_2.current_couriers.next).to eq(courier_3)
      expect(operator_2.current_couriers.next).to eq(courier_1)
    end

    it 'correct coordinates' do
      expect(operator_1.directions_to_position(directions_1)).to eq( [[0, 1], [1, 0], [0, -1], [-1, 0]] )
      expect(operator_1.directions_to_position(directions_3)).to eq( [[0, 1], [1, 0]] )
      expect(operator_1.directions_to_position(directions_4)).to eq( [] )
    end
    
  context 'more coordinates than couriers' do
    it 'correct sharing of coordinates between couriers' do
      operator_1.directions_to_position(directions_1)
      operator_1.deliver
      expect(courier_1.history).to eq({[0, 0] => 2, [0, 1] => 1})
      expect(courier_2.history).to eq({[0, 0] => 2, [1, 0] => 1})
    end

    it 'correct output of result' do
      operator_1.directions_to_position(directions_1)
      operator_1.deliver
      expect(operator_1.result).to eq({0 => {[0, 0] => 2, [0, 1] => 1}, 1 => {[0, 0] => 2, [1, 0] => 1}})    
    end
  end


  context 'more couriers than coordinates' do
    it 'correct sharing of coordinates between couriers' do
      operator_2.directions_to_position(directions_2)
      operator_2.deliver
      expect(courier_1.history).to eq({[0, 0] => 1, [0, 1] => 1})
      expect(courier_2.history).to eq({[0, 0] => 1, [1, 0] => 1})
      expect(courier_3.history).to eq({[0, 0] => 1})
    end

    it 'correct output of result' do
      operator_2.directions_to_position(directions_2)
      operator_2.deliver
      expect(operator_2.result).to eq({0 => {[0, 0] => 1, [0, 1] => 1}, 1 => {[0, 0] => 1, [1, 0] => 1}, 2 => {[0, 0] => 1}})    
    end
  end

  it 'impossible delivery without couriers' do
    operator_3.directions_to_position(directions_1)
    expect(operator_3.deliver).to be_nil      
  end 
  
  it 'no moving without coordinates' do
    operator_1.directions_to_position(directions_4)
    operator_1.deliver
    expect(operator_1.result).to eq({0 => {[0, 0] => 1}, 1 => {[0, 0] => 1}})     
  end 
end