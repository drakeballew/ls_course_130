def step(start_num, end_num, step_num)
  value = start_num
  while value <= end_num
    yield(value)
    value += step_num
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
