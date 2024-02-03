def disemvowel(comment)
    vowels = 'AaEeIiOoUu'
    
    # Remove vowels from the comment
    result = comment.tr(vowels, '')
    
    puts result
end

# Example usage:
disemvowel('I wanna sleep more!')
