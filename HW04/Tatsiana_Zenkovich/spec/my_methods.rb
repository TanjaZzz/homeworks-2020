module MyArray
  # rubocop:disable Style/For: Prefer each over for
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in (0..length - 1)
      proc.call(self[i])
    end
    self
  end

  def my_map
    results = []
    if block_given?
      for i in (0..length - 1)
        proc.call(self[i])
        results << proc.call(self[i])
      end
      return results
    end
    return to_enum(:my_map) unless block_given?
  end

  def my_select
    if block_given?
      results = []
      for i in (0..length - 1)
        proc.call(self[i])
        results << self[i] if proc.call(self[i]) == true
      end
      return results
    end
    return to_enum(:my_select) unless block_given?
  end
  # rubocop:enable Style/For: Prefer each over for
end

class Array
  include MyArray
end
