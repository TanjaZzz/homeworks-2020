# frozen_string_literal: true

lines = []
File.open('log.txt') do |review_file|
  lines = review_file.readlines
end
relevant_line = []
lines.each do |line|
  relevant_line << line if line.include?('error')
end
