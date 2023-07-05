# frozen_string_literal: true

# CaesarCipher represents a class that provides methods for encrypting strings using the Caesar Cipher algorithm.
class CaesarCipher
  LETTERS = ('a'..'z').to_a.freeze

  def encrypt(string, key)
    result = ''
    string.each_char do |char|
      if LETTERS.include?(char.downcase)
        new_char = char == char.downcase ? handle_lowercase(char, key) : handle_uppercase(char, key)
        result << new_char
      else
        result << char
      end
    end
    result
  end

  private

  def handle_lowercase(char, key)
    min = 'a'.ord
    max = 'z'.ord
    handle_cases(char, key, min, max)
  end

  def handle_uppercase(char, key)
    min = 'A'.ord
    max = 'Z'.ord
    handle_cases(char, key, min, max)
  end

  def handle_cases(char, key, min, max)
    value = char.ord + key
    new_char_value = new_char_value(value, min, max)
    new_char_value.chr
  end

  def new_char_value(value, min, max)
    if value > max
      (min + (value - max) - 1)
    elsif value < min
      (max - (min - value) + 1)
    else
      value
    end
  end
end
