require_relative "module2_assignment"

# This script provides a sample execution of the Solution class
# that is consistent with what the rspec evaluation will perform.
# You may use it to sanity check your actual solution along side
# the rspec tests.

solution = Solution.new
#expect errors until you implement these methods
solution.analyze_file('test.txt')
# solution.calculate_line_with_highest_frequency
# solution.print_highest_word_frequency_across_lines




# def count_words(words)
#   words.each_with_object(Hash.new 0) do |word, counter|
#     counter[word] += 1
#   end
# end
 
# def print_counts(words)
#   count_words(words).each do |word, count|
#     puts "#{word}: #{count}"
#   end
# end
 

# array = ["meow", "meow", "wow", "wow"]
# print_counts(array)