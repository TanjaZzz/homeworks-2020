# frozen_string_literal: true

lines = []

File.open ('log.txt') do |review_file|
  lines = review_file.readlines
end

relevant_line = []
lines.each do |line|
  if line =~ %r{(\d+\.\d+\.\d+\.\d+)\s\-\s\-\s\[(\d+/\w+/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d+)\]\s\W\w+(\s\W\w+\W\d+\W\w+)\s\w+/\d+\.\d+\W\s(.*)}
    line = "\"#{Regexp.last_match(2)} FROM: #{Regexp.last_match(1)} TO: #{Regexp.last_match(3).upcase}\""
    relevant_line << line
end
end
puts relevant_line
