day,can = gets.split(" ").map(&:to_i)
line = gets.split(" ").map(&:to_i)
num = 0
first_day = 0
max = 0


while num + can-1 < day
  count = 0
  line[num,can].each do |i|
    count += i
  end

  if count > max
    max_day = 1
    max = count
    first_day = num+1
  elsif count >= max
    max_day += 1
  end
  num += 1
end

puts "#{max_day} #{first_day}"