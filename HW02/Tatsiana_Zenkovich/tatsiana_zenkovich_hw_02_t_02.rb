

  lines = []

  File.open ("log.txt") do |review_file|
     lines = review_file.readlines
  end

  relevant_line = []
  lines.each do |line| 
    if line =~ /(\d+\.\d+\.\d+\.\d+)\s\-\s\-\s\[(\d+\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d+)\]\s\W\w+(\s\W\w+\W\d+\W\w+)\s\w+\/\d+\.\d+\W\s(.*)/
      line = "\"#{$2} FROM: #{$1} TO: #{($3).upcase}\""
      relevant_line << line
	end
  end
  puts relevant_line
