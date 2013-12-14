require 'pry'
class TddWordAnalytics
  attr_reader :sentence
  def initialize(sentence)
    @sentence = sentence
  end

  def analytics
   analytic = []
   word = word_count.sort { |a,b| b[1]<=>a[1] }[0..1]
   word = word.map do |word|
     word[0]
   end

   letter = letter_count.sort { |a,b| b[1]<=>a[1] }[0..2]
   letter = letter.map do |letter|
     letter[0]
   end
   analytic << word
   analytic << letter
   analytic
  end

  def word_count
    counter = Hash.new(0)
    sentence.split(' ').each do |word|
      counter[word] += 1
    end
    counter
  end

  def letter_count
    counter = Hash.new(0)
    sentence.split('').each do |letter|
      if letter.match(/[a-zA-Z]/) != nil
        letter = letter.downcase
        counter[letter] += 1
      end
    end
    counter
  end

  def symbol_count
    counter = Hash.new(0)
    sentence.split('').each do |letter|
      if letter.match(/[^A-Za-z0-9_\s\t\r\n\f]/)
        counter[letter] += 1
      end
    end
    counter
  end
end
