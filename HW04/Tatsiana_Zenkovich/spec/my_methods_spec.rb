require 'my_methods.rb'
# rubocop:disable Metrics/BlockLength
describe '#my_each' do
  subject { Array.new([1, 2, 3, 4, 5]) }

  context 'when a block given' do
    it 'calls the block passed to it exact number of times' do
      expect do |block|
        subject.my_each(&block)
      end.to yield_control.exactly(5).times
    end

    it 'yields each element to the block' do
      expect do |block|
        subject.my_each(&block)
      end.to yield_successive_args(1, 2, 3, 4, 5)
    end

    it 'returns the original array' do
      expect(subject.my_each {}).to eq([1, 2, 3, 4, 5])
    end

    context 'when empty array is given' do
      subject { Array.new([]) }
      it 'returns an empty array' do
        expect(subject.my_each { |x| x + 3 }).to eq([])
      end
    end
  end

  context 'when no block given' do
    it 'returns the Enumerator' do
      expect(subject.my_each).to be_an_instance_of(Enumerator)
    end
  end
end
# rubocop:enable Metrics/BlockLength
describe '#my_map' do
  subject { Array.new(array).my_map { |x| x + 3 } }
  let(:array) { [1, 2, 3, 4, 5] }

  context 'when a block given' do
    it { is_expected.to eq [4, 5, 6, 7, 8] }

    it 'returns an array with same length' do
      expect(array.my_map { |x| x + 3 }.length).to eq(array.length)
    end

    context 'when empty array is given' do
      let(:array) { [] }
      it { is_expected.to eq [] }
    end
  end

  context 'when no block given' do
    it 'returns the Enumerator' do
      expect(array.my_map).to be_an_instance_of(Enumerator)
    end
  end
end

describe '#my_select' do
  subject { Array.new(array).my_select { |x| x < 3 } }
  let(:array) { [1, 2, 3, 4, 5] }

  context 'when a block is given' do
    it { is_expected.to eq [1, 2] }

    it 'returns an array with at most the same length' do
      expect(array.my_map { |x| x < 5 }.length).to be <= array.length
    end

    context 'when empty array is given' do
      let(:array) { [] }
      it { is_expected.to eq [] }
    end
  end

  context 'when no block given' do
    it 'returns the Enumerator' do
      expect(array.my_select).to be_an_instance_of(Enumerator)
    end
  end
end
