def one?(collection)
  counter = 0
  collection.each do |item|
    counter += 1 if yield(item)
    break if counter == 2
  end
  return true if counter == 1
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true


def ls_one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

p ls_one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
