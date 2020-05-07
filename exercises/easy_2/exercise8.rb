require 'pry'

def max_by(array)
  return nil if array.empty?

  max_element = array.first
  max_result = yield(max_element)

  array.each do |element|
    if yield(element) >= max_result
      max_element = element
      max_result = yield(element)
    end
  end
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
