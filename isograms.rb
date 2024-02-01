require 'rspec'

def is_isogram(string)
    string.downcase!
    string.each_char do |char|
      return false if string.count(char) > 1
    end
    true
  end
  
  describe 'is_isogram' do
    it 'Fixed tests' do
      expect(is_isogram('Dermatoglyphics')).to eq(true)
      expect(is_isogram('isogram')).to eq(true)
      expect(is_isogram('documentary')).to eq(true)
  
      expect(is_isogram('aba')).to eq(false)
      expect(is_isogram('moOse')).to eq(false)
      expect(is_isogram('isIsogram')).to eq(false)
  
      expect(is_isogram('')).to eq(true)
    end
  end