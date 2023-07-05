# frozen_string_literal: true

# It return a hash listing each substring (case insensitive) that was found in
# the original string and how many times it was found.
# The substrings are present in the array of valid substrings (dictionary).
class SubStrings
  def get_hash(text, dictionary)
    hash = Hash.new(0)
    transformed_text = text.split.map(&:downcase)
    dictionary.each do |substring|
      transformed_text.each do |word|
        coincidences = word.scan(substring).count
        hash[substring] += coincidences if coincidences.positive?
      end
    end
    hash
  end
end
