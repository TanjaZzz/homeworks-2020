require 'my_methods.rb'

describe '#my_each' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }

  context 'a block given' do
    it 'calls the block passed to it exact number of times' do
      expect do |block|
        a.my_each(&block)
      end.to yield_control.exactly(5).times
    end

    it 'yields each element to the block' do
      expect do |block|
        a.my_each(&block)
      end.to yield_successive_args(1, 2, 3, 4, 5)
    end

    it 'returns the original array' do
      expect(a.my_each {}).to eq([1, 2, 3, 4, 5])
    end
  end

  context 'no block given' do
    it 'returns the Enumerator' do
      expect(a.my_each).to be_an_instance_of(Enumerator)
    end
  end
end

describe '#my_map' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }
  context 'a block given' do
    it 'returns a calculated array' do
      expect(a.my_map { |x| x + 3 }).to eq([4, 5, 6, 7, 8])
    end

    it 'returns an array with same length' do
      expect(a.my_map { |x| x + 3 }.length).to eq(a.length)
    end
  end
  context 'no block given' do
    it 'returns the Enumerator' do
      expect(a.my_map).to be_an_instance_of(Enumerator)
    end
  end
  context 'empty array is given' do
    let(:a) { Array.new([]) }
    it 'returns an empty array' do
      expect(a.my_map { |x| x + 3 }).to eq([])
    end
  end
end

describe '#my_select' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }
  context 'a block is given' do
    it 'returns a new array which satisfy the block`s condition' do
      expect(a.my_select { |x| x < 3 }).to eq([1, 2])
    end
    it 'returns an array with at most the same length' do
      expect(a.my_map { |x| x < 5 }.length).to be <= a.length
    end
  end
  context 'no block given' do
    it 'returns the Enumerator' do
      expect(a.my_select).to be_an_instance_of(Enumerator)
    end
  end
  context 'empty array is given' do
    let(:a) { Array.new([]) }
    it 'returns an empty array' do
      expect(a.my_select { |x| x < 5 }).to eq([])
    end
  end
end
