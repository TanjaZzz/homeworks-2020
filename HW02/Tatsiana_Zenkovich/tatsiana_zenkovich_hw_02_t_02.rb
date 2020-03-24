lines = []

File.open('log.txt') do |review_file|
  lines = review_file.readlines
end

found = []
lines.each do |i|
  IP = i[/\d+\.\d+\.\d+\.\d+/]
  DATE = i[%r{\[\d+/\w+/\d{4}\:\d{2}\:\d{2}\:\d{2}\s\+\d+\]}]
  ADDRESS = i[/T .*H/]
  if IP && DATE && ADDRESS
    found << DATE[1..-1] + 'FROM:' + IP[0..0] + 'TO:' + ADDRESS[1..-3].upcase
  end
end
puts found
