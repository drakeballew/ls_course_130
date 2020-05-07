require 'pry'

def zip(arr1, arr2)
  new_arr = []
  counter = 0
  while counter < arr1.size
    new_arr << [arr1[counter], arr2[counter]]
    counter += 1
  end
  new_arr
end

p zip([1, 2, 3], [4, 5, 6])

def ls_zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end
