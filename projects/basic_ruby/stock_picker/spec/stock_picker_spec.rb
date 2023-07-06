require 'spec_helper'
require_relative '../lib/stock_picker'

RSpec.describe StockPicker do
  let(:object) { StockPicker.new }

  describe 'stock picker project' do
    context 'when stock prices are increaing' do
      it 'returns the first and last day' do
        stock_prices = [1, 2, 3, 4, 5, 6]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([0, 5])
      end

      it 'returns the first and last day' do
        stock_prices = [2, 4, 6, 8]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([0, 3])
      end
    end

    context 'when stock prices are decreaing' do
      it 'returns an empty array because it means that there are no any good day to buy and sell' do
        stock_prices = [6, 5, 4, 3, 2, 1]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([])
      end
    end

    context 'when stock prices are mixing values' do
      it 'returns the correct pair of days' do
        stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([1, 4])
      end

      it 'returns the correct pair of days' do
        stock_prices = [17, 13, 6, 9, 15, 8, 6, 1]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([2, 4])
      end

      it 'returns the correct pair of days' do
        stock_prices = [1, 2, 3, 4, 5, 4, 3, 2, 1]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([0, 4])
      end

      it 'returns the correct pair of days' do
        stock_prices = [5, 4, 3, 2, 1, 2, 3, 4, 5]
        result = object.best_days_to_buy_and_sell(stock_prices)
        expect(result).to eq([4, 8])
      end
    end
  end
end
