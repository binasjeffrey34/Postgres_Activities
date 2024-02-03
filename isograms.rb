def is_isogram(string)
    string.downcase!
    string.each_char do |char|
      return false if string.count(char) > 1
    end
    true
  end
  
puts is_isogram('Hippopotamus')
puts is_isogram('Commemorate')
puts is_isogram('Untie')
puts is_isogram('Creation')