# frozen_string_literal: true

# calculate time between all actions with Calling core (more then 2 also)
# taking into account that time can be on the edge of midnight
# and forming outout like this
# 49.1 seconds between calling core with action
# event
# messages

def task3
  lines = read_file('log.txt')
  relevant_line = parsing(lines)
  check_the_line(relevant_line)
  time_between = count_time(relevant_line)
  names = names_array(relevant_line)
  time_between = check_single_calling_core(time_between)
  final_array = creating_output(time_between, names)
  puts final_array
end

def read_file(file_name)
  lines = []
  File.open(file_name) do |review_file|
    lines = review_file.readlines
  end
  lines
end

def parsing(lines)
  relevant_line = []
  lines.each do |line|
    relevant_line << line if line.include?('Calling core with action')
  end
  relevant_line
end

# check if the log contains any Calling core with action
def check_the_line(relevant_line)
  puts '0' && exit if relevant_line == []
end

# count time for each Calling core with action
def count_time(relevant_line)
  time_between = []
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
    time_between << time_difference
  end
  time_between
end

def names_array(relevant_line)
  names = []
  relevant_line.each do |new_line|
    name = new_line.split(' ').last
    names << name
  end
  names
end

# check if there was only one Calling core with action
def check_single_calling_core(time_between)
  time_between.delete_at(0)
  time_between = [0] if time_between == []
  time_between
end

# create part of output
def creating_output(time_between, names)
  time_between.collect! do |x|
    x.to_s + ' seconds between calling core with action '
  end
  # create additional array
  names_for_array = names.clone
  names.shift
  # create and array with info about 2 actions and time between them
  time_between.zip(names_for_array, names)
end

task3
