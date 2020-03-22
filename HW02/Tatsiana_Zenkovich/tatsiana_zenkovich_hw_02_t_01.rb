def task_1()

  lines = []

  File.open ("log.txt") do |review_file|
  lines = review_file.readlines
    end

  relevant_line = []
  lines.each do |line|
    if line.include?("error")
      relevant_line << line
    end
  end

  puts relevant_line
end

task_1()