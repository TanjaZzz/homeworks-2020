

   puts "Please, type your string"
   input = gets.chomp

   numbers_count = 0
   string_count = 0

   input.split('').each do |x|
    if x =~ /\d/
      numbers_count += 1
    end
    if x =~ /[a-z]|[A-Z]/
      string_count += 1
    end
  end

    puts "letters: #{string_count}, digits: #{numbers_count}"


