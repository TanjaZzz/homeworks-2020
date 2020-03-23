def task1
  lines = File.readlines('log.txt')
  puts lines.select { |line| line.include?('error') }.first
end

task1
