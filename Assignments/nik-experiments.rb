#First:

#cur_weather = %Q{ It's a hot day outside 
#Grab your umbrellas...}
#
#cur_weather.lines do |line|
#	line.sub! 'hot', 'rainy'
#	p "#{line}" # Actual Line
#	p "#{line.strip}" # removes \n and any leading and trailing space
#	p "#{line.lstrip}" # removes the leading space
#	p "#{line.rstrip}" # removes the trailing space and \n
#	p "#{line.chomp}" # removes only \n
#end
#
###Output:
#
## => " It's a rainy day outside \n"
## => "It's a rainy day outside"
## => "It's a rainy day outside \n"
## => " It's a rainy day outside"
## => " It's a rainy day outside "
## => "Grab your umbrellas..."
## => "Grab your umbrellas..."
## => "Grab your umbrellas..."
## => "Grab your umbrellas..."
## => "Grab your umbrellas..."

#Second
#case 19
#	when 0..18 then p "Minor"
#	else p "Adult"
#end

#Third
#my_hash = Hash.new("No such key yet")
#p my_hash[0] # "No such key yet"
#p my_hash["some_key"] # "No such key yet"

#Fourth
#def adjust (props = {fore: "red" , back: "white"})
#	puts "Foreground: #{props[:fore]}" if props[:fore]
#	puts "Background: #{props[:back]}" if props[:back]
#end
#
#adjust
#adjust ({:fore => "green"})
#adjust back: "yella"
#adjust :back => "yella"

class Person
	attr_accessor :name
	attr_accessor :age

	def initialize (name, ageVar)
		@name = name
#		self.age = ageVar
		@age = ageVar unless ageVar > 100
		p age
	end
#	def age= age
#		@age = age unless age > 100
#	end
end

p1 = Person.new("John", 20)
p "#{p1.name} #{p1.age}"
p1.age = 123
p p1.age