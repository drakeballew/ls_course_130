def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? }
p any?([1, 3, 5, 7]) { |value| value.even? }
