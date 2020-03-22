# frozen_string_literal: true

# calculate time between all actions with Calling core (more then 2 also)
# taking into account that time can be on the edge of midnight
# and forming outout like this
# 49.1 seconds between calling core with action
# event
# messages

lines = []

File.open('log.txt') do |review_file|
  lines = review_file.readlines
end

relevant_line = []
lines.each do |line|
  relevant_line << line if line.include?('Calling core with action')
end
# check if the log contains any Calling core with action
if relevant_line == []
  puts '0'
  exit
end
# count time for each Calling core with action
time_between = []
names = []
data0 = relevant_line[0].split('-')[2][1]
t0 = 0

relevant_line.each do |new_line|
  time = new_line.split(' ')[1]
  hour = time.split(':')[0].to_i
  minute = time.split(':')[1].to_i
  seconds = time.split(':')[2].to_i
  microsec = time.split('.').last.to_i
  seconds += microsec / 10.0
  data1 = new_line.split('-')[2][1]
  # check if it's time over midnight between actions
  t1 = if data0 == data1
         seconds + minute * 60 + hour * 60 * 60
       else
         seconds + minute * 60 + hour * 60 * 60 + 86_400
       end
  # count time between actions
  time_difference = (t1 - t0).round(1)
  # save names of actions in array and time between actions in another array
  t0 = t1
  name = new_line.split(' ').last

  time_between << time_difference
  names << name
end
# check if there was only one Calling core with action
time_between.delete_at(0)
time_between = [0] if time_between == []
# create part of output
time_between.collect! do |x|
  x.to_s + ' seconds between calling core with action '
end
# create additional array
names_for_array = names.clone
names.shift
# create and array with info about 2 actions and time between them
final_array = time_between.zip(names_for_array, names)
puts final_array
