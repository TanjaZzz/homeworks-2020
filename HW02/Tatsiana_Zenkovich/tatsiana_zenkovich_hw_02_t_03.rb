def task_3()

  lines = []

  File.open ("log.txt") do |review_file|
  lines = review_file.readlines
    end

  relevant_line = []
  lines.each do |line|
    if line.include?("Calling core with action")
      relevant_line << line
    end
  end

if relevant_line == []
  puts "0"
  exit
end

time_between = []
names = []
data = []
data0 = relevant_line[0].split('-')[2][1]
array_of_time = []
t0 = 0

relevant_line.each do |new_line|
  time = new_line.split(' ')[1]
  hour = time.split(':')[0].to_i
  minute = time.split(':')[1].to_i
  seconds = time.split(':')[2].to_i
  microsec = time.split('.').last.to_i
  seconds = seconds + microsec/10.0
  data1 = new_line.split('-')[2][1]

    if data0 == data1 
      t1 = seconds + minute*60 + hour*60*60
    else
      t1 = seconds + minute*60 + hour*60*60 + 86400
    end

  data1 = data0
  time_difference = (t1 - t0).round(1)

  t0 = t1
  name = new_line.split(' ').last

  time_between << time_difference
  names << name

end
time_between.delete_at(0)
  if time_between == []
    time_between = [0]
  end
time_between.collect!{|x| x.to_s+" seconds between calling core with action "}


names_for_array = names.clone
names.shift

final_array = time_between.zip(names_for_array, names)
puts final_array

end
task_3()