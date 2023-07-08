require 'spec_helper'
require_relative '../lib/bubble_sort'

RSpec.describe BubbleSort do
  describe 'bubble sort project' do
    let(:object) { BubbleSort.new }

    context 'when passing a messy array' do
      it 'returns its ascending sorted version' do
        array = [5, 4, 3, 2, 1]
        result = object.call(array)
        expect(result).to eq([1, 2, 3, 4, 5])
      end

      it 'returns its ascending sorted version' do
        array = [-1, -2, -3, -4, -5]
        result = object.call(array)
        expect(result).to eq([-5, -4, -3, -2, -1])
      end

      it 'returns its ascending sorted version' do
        array = Array.new(10).map { rand(100) }
        result = object.call(array)
        expect(result).to eq(array.sort)
      end

      it 'returns its ascending sorted version' do
        array = Array.new(20).map { rand(-100..100) }
        result = object.call(array)
        expect(result).to eq(array.sort)
      end

      it 'returns its ascending sorted version' do
        array = %w(t s k i e q h)
        result = object.call(array)
        expect(result).to eq(%w(e h i k q s t))
      end
    end

    context 'when passing a messy array' do
      it 'returns its descending sorted version' do
        array = [1, 2, 3, 4, 5]
        result = object.call(array, 'desc')
        expect(result).to eq([5, 4, 3, 2, 1])
      end

      it 'returns its descending sorted version' do
        array = [-5, -4, -3, -2, -1]
        result = object.call(array, 'desc')
        expect(result).to eq([-1, -2, -3, -4, -5])
      end

      it 'returns its descending sorted version' do
        array = Array.new(10).map { rand(100) }
        result = object.call(array, 'desc')
        expect(result).to eq(array.sort.reverse)
      end

      it 'returns its descending sorted version' do
        array = Array.new(20).map { rand(-100..100) }
        result = object.call(array, 'desc')
        expect(result).to eq(array.sort.reverse)
      end

      it 'returns its descending sorted version' do
        array = %w(t s k i e q h)
        result = object.call(array, 'desc')
        expect(result).to eq(%w(t s q k i h e))
      end
    end
  end
end
