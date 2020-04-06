module MyArray
  def my_each
    if block_given?
      (0..length - 1).each do |i|
        proc.call(self[i])
      end
    elsif (0..length - 1).each do |i|
            self[i]
          end
    end
    self
  end

  def my_map
    results = []
    my_each do |item|
      results << yield(item)
    end
    results
  end

  def my_select
    results = []
    my_each do |item|
      results << item if yield(item) == true
    end
    results
  end
end
class Array
  include MyArray
end
