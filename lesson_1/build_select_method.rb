def select(array)
  counter = 0
  new_arr = []

  while counter < array.size
    new_arr << array[counter] if yield(array[counter])
    counter += 1
  end

  new_arr
end


array = [1, 2, 3, 4, 5]
p select(array) { |num| puts num }
