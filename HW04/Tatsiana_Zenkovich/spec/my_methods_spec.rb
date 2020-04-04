require 'my_methods.rb'

describe '#my_each' do
  it 'calls the block passed to it' do
    a = Array.new([1, 2, 3, 4, 5])
    expect do |block|
      a.my_each(&block)
    end.to yield_control.exactly(5).times
  end

  it 'yields each element to the block' do
    a = Array.new([1, 2, 3, 4, 5])
    expect do |block|
      a.my_each(&block)
    end.to yield_successive_args(1, 2, 3, 4, 5)
  end

  it 'returns the original array' do
    a = Array.new([1, 2, 3, 4, 5])
    expect(a.my_each {}).to eq([1, 2, 3, 4, 5])
  end
end

describe '#my_map' do
  context 'non-empty array is given' do
    it 'returns a calculated array' do
      a = Array.new([1, 2, 3, 4, 5])
      expect(a.my_map { |x| x + 3 }).to eq([4, 5, 6, 7, 8])
    end
  end
  context 'empty array is given' do
    it 'returns an empty array' do
      a = Array.new([])
      expect(a.my_map { |x| x + 3 }).to eq([])
    end
  end
end

describe '#my_select' do
  context 'non-empty array is given' do
    it 'returns a new array with true values by the block.' do
      a = Array.new([1, 2, 3, 4, 5])
      expect(a.my_select { |x| x < 5 }).to eq([1, 2, 3, 4])
    end
  end
  context 'empty array is given' do
    it 'returns an empty array' do
      a = Array.new([])
      expect(a.my_select { |x| x < 5 }).to eq([])
    end
  end
end
