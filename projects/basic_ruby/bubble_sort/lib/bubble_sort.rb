# frozen_string_literal: true

# Takes an array and returns a sorted array using the Bubble Sort algorithm
class BubbleSort
  def call(array, type = 'asc')
    length = array.length - 1
    length.times do |index|
      array, swap_counter = sorting(array, length - index, type)
      break if swap_counter.zero?
    end
    array
  end

  private

  def sorting(array, number_of_times, type)
    swap_counter = 0
    number_of_times.times do |index|
      next unless (type == 'asc' && array[index] > array[index + 1]) ||
                  (type == 'desc' && array[index] < array[index + 1])

      value_helper = array[index]
      array[index] = array[index + 1]
      array[index + 1] = value_helper
      swap_counter += 1
    end
    [array, swap_counter]
  end
end
