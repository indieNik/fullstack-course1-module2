class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number
  def initialize(c,n)
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
end

class Solution
attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
	def initialize
		@analyzers = []
	end
  def analyze_file()
		line_no = 0
		File.foreach('test.txt') do |lines|
			line_no += 1
			new_LA_obj = LineAnalyzer.new(lines, line_no)
			@analyzers << new_LA_obj
		end
	end
  def calculate_line_with_highest_frequency()
  	@highest_count_across_lines = 0
		@highest_count_words_across_lines = []
		@analyzers.each do |obj|
			if obj.highest_wf_count >= @highest_count_across_lines
				@highest_count_across_lines = obj.highest_wf_count
				@highest_count_words_across_lines.push obj
			end
		end
	end
	def print_highest_word_frequency_across_lines()
		puts "The following words have the highest word frequency per line: "
    @highest_count_words_across_lines.each do |obj|
			puts "#{obj.highest_wf_words} appears in line #{obj.line_number}"
		end
	end
end
