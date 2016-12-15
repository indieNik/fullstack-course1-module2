freq = Hash.new(0)
File.foreach('test.txt') do |line|
	line.split.each do |word|
		freq[word.downcase] += 1
	end
end

p freq.select{ |key, value| value == freq.each_value.max}.keys
#puts highest_value = 0
#freq.each do |key, value|
#	highest_value = value
#end