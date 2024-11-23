require_relative '../courier'

RSpec.describe "courier" do
  let(:courier) { Courier.new }

  it 'correct movement history without move' do
    expect(courier.history).to eq({[0, 0] => 1})
  end

  it 'correct movement history with one move right' do
    courier.move(1, 0)
    expect(courier.history).to eq({[0, 0] => 1, [1, 0] => 1})
  end

  it 'correct movement history with one move left' do
    courier.move(-1, 0)
    expect(courier.history).to eq({[0, 0] => 1, [-1, 0] => 1})
  end

  it 'correct movement history with one move up' do
    courier.move(0, 1)
    expect(courier.history).to eq({[0, 0] => 1, [0, 1] => 1})
  end

  it 'correct movement history with one move down' do
    courier.move(0, -1)
    expect(courier.history).to eq({[0, 0] => 1, [0, -1] => 1})
  end

  it 'correct movement history with two moves, one of them to the exsisting position' do
    courier.move(1, 0)
    courier.move(-1, 0)
    expect(courier.history).to eq({[0, 0] => 2, [1, 0] => 1})
  end

  it 'correct movement history with four moves' do
    courier.move(1, 0)
    courier.move(0, 1)
    courier.move(-1, 0)
    courier.move(0, -1)
    expect(courier.history).to eq({[0, 0] => 2, [1, 0] => 1, [1, 1] => 1, [0, 1] => 1})
  end	
end