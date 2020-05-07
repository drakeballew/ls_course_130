def each_cons(array, num_elements)
  array.each_index do |index|
    break if index + num_elements - 1 >= array.size
    yield(*array[index..(index + n -1)])
  end
end
