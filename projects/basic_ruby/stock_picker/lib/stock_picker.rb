# frozen_string_literal: true

# Considering an array of stock prices, one for each hypothetical day.
# Returns a pair of days representing the best day to buy and the best day to sell.
# Days start at 0 and you need to buy before you can sell.
class StockPicker
  def best_days_to_buy_and_sell(values)
    profit, index_of_min, index_of_max = Array.new(3, 0)
    values.each_with_index do |_value, index|
      next if index == values.length - 1

      new_index_of_max, new_profit = calculate_new_values(values, index)
      next unless new_profit > profit

      index_of_min = index
      index_of_max = new_index_of_max
      profit = new_profit
    end
    index_of_max.zero? ? [] : [index_of_min, index_of_max]
  end

  private

  def calculate_new_values(values, index)
    min, max = Array.new(2, values[index])
    new_index_of_max = 0
    values.slice(index + 1..-1).each_with_index do |value, j|
      if value > max
        max = value
        new_index_of_max = index + 1 + j
      end
    end
    [new_index_of_max, max - min]
  end
end
