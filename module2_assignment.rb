#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  def initialize()

  end  

  #* calculate_word_frequency() - calculates result


  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
end

#  Implement a class called Solution. 
class Solution

  def initialize
    @arrayLineAnalyzers = []
    @highest_count_words_across_lines = Hash.new{0}
    @lineWithMaxCont = [1]
    @max_count_in_line = 0
  end


  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  def analyzers(hash)

    @maxvValueInLine = Hash[*hash.max_by {|key, value| value}]
    
    if  @max_count_in_line < @maxvValueInLine.values[0]
      @max_count_in_line = @maxvValueInLine.values[0]
      @lineWithMaxCont = []
      @lineWithMaxCont <<  @line_number
    elsif   @max_count_in_line == @maxvValueInLine.values[0]
      @lineWithMaxCont <<  @line_number
    end 

    # @max_count_in_line = @maxvValueInLine.values[0]
    hash.reject! { |key, value| value != @max_count_in_line}
    @highest_count_words_across_lines.update(hash) { |key, v1, v2| v1 >= v2 ? v1 : v2 }
     
  end  
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 

  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  def analyze_file(file)
    File.open(file).each do |line| 
      @arrayLineAnalyzers << line.gsub("\n", "")
    end

    @line_number = 0
    @arrayLineAnalyzers.each do |line|
      @content = line.downcase!
      @content = @content.split
      
      @marks = @content.inject(Hash.new{0}){ |res, elem| 
        res[elem] += 1 
        res
      }
  
      @line_number += 1
      analyzers(@marks)     
    end 

    calculate_word_frequency()
    puts  "number of lines: #{@line_number}"
    calculate_line_with_highest_frequency()
  end 

  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values

  def calculate_line_with_highest_frequency()
    @arrayWordsInLine = []
    @line_count = 1

    @arrayLineAnalyzers.each do |line1|
      @content1 = line1
      @content1 = @content1.split
      
      @highest_count_words_across_lines.each do |key, value|
        if value == @highest_wf_count  &&  @content1.include?(key) && @lineWithMaxCont.include?(@line_count)
          @arrayWordsInLine << key
        end
      end

      unless @arrayWordsInLine == [] 
        puts "#{@arrayWordsInLine} (appears in line #{@line_count})"
      end  
      @arrayWordsInLine = []
      @line_count += 1 
    end 
  end 
  

  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in
  #  highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines()

  end 
  
 
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format




  def calculate_word_frequency()
    puts "что я сдесь выдаю #{@highest_count_words_across_lines}"
    @highest_wf_count = (@highest_count_words_across_lines.max_by {|key, value| value})[1]
    @highest_wf_words = @highest_count_words_across_lines.reject {| key, value | value != @highest_wf_count} 
    puts "highest word count: #{@highest_wf_count}" 
    puts "words with highest count: #{@highest_wf_words}"
  end
end
