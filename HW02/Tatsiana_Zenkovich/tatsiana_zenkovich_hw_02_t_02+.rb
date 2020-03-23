# frozen_string_literal: true

lines = []

File.open('log.txt') do |review_file|
  lines = review_file.readlines
end

re = []
lines.each do |i|
  ip = i[/\d+\.\d+\.\d+\.\d+/]
  date = i[%r{\[\d+/\w+/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d+\]}]
  adr = i[/T .*H/]
  if ip && date && adr
    re << date[1..-1] + 'FROM:' + ip[0..0] + 'TO:' + adr[1..-3].upcase
  end
end
puts re
