puts "Welcome to my first program!"
print "Type hours"
h = gets.chomp.to_i
print "Type minutes"
m = gets.chomp.to_i
puts "Awesome! Let me work hard instead of you!"
angle= (30*h-5.5*m).abs.to_s
puts "The angle between #{h} hours and #{m} minutes hands is #{angle} degrees"
