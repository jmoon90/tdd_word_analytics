require './tdd_word_analytics'

describe TddWordAnalytics do
  describe '#word' do
    it 'counts the number for each word' do
      expect(TddWordAnalytics.new('Hello').word_count).to eql({"Hello"=>1})
    end

    it 'counts parses words in a sentence and give it a counter' do
      expect(TddWordAnalytics.new('This is my script').word_count).to eql({'This'=>1, 'is'=>1, 'my'=>1, 'script'=>1})
    end
  end

  describe '#letter' do
    it 'counts how many times a given letter is used regardless of capitalization' do
      expect(TddWordAnalytics.new('Hello').letter_count).to include({'h'=>1, 'e'=>1, 'l'=>2, 'o'=>1})
    end

    it 'only reads in letters' do
      expect(TddWordAnalytics.new('5 days').letter_count).to include({'d'=>1, 'a'=>1, 'y'=>1, 's'=>1})
    end
  end

  describe '#non_letter' do
    it 'counts how many times any non_letter symbol is used excluding white space' do
      expect(TddWordAnalytics.new("5# y'ea").symbol_count).to include({'#'=>1, "'"=>1})
    end
  end

  describe '#analytics' do
    tdd = TddWordAnalytics.new("What is up up")

    it 'outputs the most common word and letter' do
      expect(tdd.analytics).to match_array([['up','is'],['p','u','i']])
    end
  end
end
