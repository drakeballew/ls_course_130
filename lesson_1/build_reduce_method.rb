def reduce(array, start='')
  counter = 0
  acc = start

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end

p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
