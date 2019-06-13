require 'byebug'
class ParseFiles
	def working(code)
		puts code
		data = code.split
		data.each do |line|
			javaInteger = /[0-9](([0-9,”_”])*[0-9])?/ #java for integer
			javaCharClass = /[a-zA-Z$_][a-zA-Z0-9$_]*/ #java for character class
			javaBoolean = /”true”|”false”/ #java boolean value
			javaSpace = /[ \t\r\n\u000C]+/ #java whitespace
			rubySpace = /(‘ ‘|’\t’)+/ #ruby for whitespace
			if line.match(/public|private|protected|default|static|$/) and line.match(javaCharClass) or line.match(javaInteger) or line.match(javaBoolean) or line.match(javaSpace) 
				puts "java language"
			elsif line.match(rubySpace) or line.match(javaCharClass)
				puts "ruby"
			end
		end
	end
end

obj1 = ParseFiles.new
obj1.working(open("/home/ketan/parser/ParseJava.txt").read)
