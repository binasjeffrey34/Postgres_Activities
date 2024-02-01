def unique_order(sequence)
    unique_items = []
  
    sequence.each_char do |item, index|
      # For the first element, add it to the result
      if index == 0
        unique_items << item
      else
        # Compare with the previous element, add to result if different
        unique_items << item unless item == sequence[index.to_i - 1]
      end
    end
  
    unique_items
  end
  
  # Test cases
  puts unique_order('AAAABBBBCCCDAAABB').inspect # Output: ['A', 'B', 'C', 'D', 'A', 'B']
  puts unique_order('ABBCcAD').inspect           # Output: ['A', 'B', 'C', 'c', 'A', 'D']
  puts unique_order([1, 2, 2, 3, 3]).inspect     # Output: [1, 2, 3]
  