def unique_order(sequence)
    unique_items = []
  
    (0...sequence.length).each do |i|
        current_element = sequence[i]

        if current_element != sequence[i+1]
            unique_items << current_element
    end
    end
  
    unique_items
  end
  
  puts unique_order('AAAABBBBCCCDAAABB').inspect # Output: ['A', 'B', 'C', 'D', 'A', 'B']
  puts unique_order('ABBCcAD').inspect           # Output: ['A', 'B', 'C', 'c', 'A', 'D']
  puts unique_order([1, 2, 2, 3, 3]).inspect     # Output: [1, 2, 3]
  