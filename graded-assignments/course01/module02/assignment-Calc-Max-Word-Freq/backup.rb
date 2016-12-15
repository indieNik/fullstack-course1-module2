#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
#  @highest_wf_count # a number with maximum number of occurrences for a single word (calculated)
#  @highest_wf_words # an array of words with the maximum number of occurrences (calculated)
#	@content          # the string analyzed (provided)
#	@line_number      # the line number analyzed (provided)
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number
  #Add the following methods in the LineAnalyzer class.
  def initialize(c,n) # taking a line of text (content) and a line number
		@content = c
		@line_number = n
		calculate_word_frequency(c,n) #return
	end
  def calculate_word_frequency(line, n) # calculates result
		word_count = Hash.new(0)
		line.split.each do |word|
			word_count[word.downcase] += 1
		end
		self.highest_wf_count = word_count.each_value.max
		self.highest_wf_words = word_count.select{ |key, value| value == word_count.each_value.max}.keys
	end
	def to_s
		puts "#{line_number} : #{content}"
		puts "Count : #{highest_wf_count}"
		puts "Words : #{highest_wf_words}"
	end
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

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
	attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
	def initialize
		@analyzers = []
	end
	# Implement the following methods in the Solution class.
  def analyze_file() # processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
		line_no = 0
		File.foreach('test.txt') do |lines|
			line_no += 1
			new_LA_obj = LineAnalyzer.new(lines, line_no)
			@analyzers << new_LA_obj
		end
		puts @analyzers
	end
  def calculate_line_with_highest_frequency() # determines the highest_count_across_lines and highest_count_words_across_lines attribute values
  	@highest_count_across_lines = 0
		@highest_count_words_across_lines = []
		@analyzers.each do |obj|
			if obj.highest_wf_count >= @highest_count_across_lines
				@highest_count_across_lines = obj.highest_wf_count
				@highest_count_words_across_lines.push obj
			end
		end
	end
	def print_highest_word_frequency_across_lines() # prints the values of LineAnalyzer objects in highest_count_words_across_lines in the specified format
		puts "The following words have the highest word frequency per line: "
    @highest_count_words_across_lines.each do |obj|
			puts "#{obj.highest_wf_words} appears in line #{obj.line_number}"
		end
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
end
