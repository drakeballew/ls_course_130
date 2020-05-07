def drop_while(collection)
  new_arr = []
  collection.each { |element| new_arr << element if yield(element) }
  collection - new_arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? }
p drop_while([1, 3, 5, 6]) { |value| value.even? }
p drop_while([1, 3, 5, 6]) { |value| true }
p drop_while([1, 3, 5, 6]) { |value| false }
p drop_while([1, 3, 5, 6]) { |value| value < 5 }
p drop_while([]) { |value| true }
