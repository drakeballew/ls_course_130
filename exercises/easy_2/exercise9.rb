def each_cons(array)
  array.each_with_index do |element, index|
    break if index + 1 >= array.size
    yield(element, array[index + 1])
  end
end

def ls_each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
end
