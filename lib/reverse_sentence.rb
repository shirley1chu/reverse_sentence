# A method to reverse the words in a sentence, in place.
# Time complexity: O(n^2). string_reverse is O(n) and reverse_words is O(n^2). Since reverse_sentence is comprised of those two methods, then it takes the highest time complexity, O(n^2)
# Space complexity: Constant, because regardless of the length of the sentence, it will awlays store i, j, beg_idx, end_idx, c, and b

# HELPER METHODS
def string_reverse(my_string)
  return nil unless my_string
  length = 0

  while my_string[length]
    length += 1
  end

  j = length - 1
  i = 0

  until i > j
    b = my_string[j]
    my_string[j] = my_string[i]
    my_string[i] = b
    i += 1
    j -= 1
  end
  return my_string
end

def reverse_partial_word(string, beg_idx, end_idx)
  while beg_idx < end_idx
    temp = string[beg_idx]
    string[beg_idx] = string[end_idx]
    string[end_idx] = temp
    beg_idx += 1
    end_idx -= 1
  end
  return string
end

def reverse_words(my_words)
  return nil unless my_words
  i = 0
  j = my_words.length - 1

  while i < j
    while my_words[i] == " "
      i += 1
    end
    b = i
    until my_words[b] == " " || b == j + 1
      b += 1
    end
    c = b - 1
    reverse_partial_word(my_words, i, c)
    i = b + 1
  end
end

# END OF HELPER METHODS

def reverse_sentence(my_sentence)
  string_reverse(my_sentence)
  reverse_words(my_sentence)
end
