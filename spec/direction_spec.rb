require_relative '../direction'

RSpec.describe "direction" do
  let(:direction) { Direction.new }

  it 'correct direction from file' do
    # allow(File).to receive(:open).and_return(StringIO.new(">v<"))
    allow(File).to receive_message_chain({ open: 'input.txt' }, :read).and_return(">v<")
    expect(direction.get_direction_from_file).to eq(['>', 'v', '<'])
  end
end