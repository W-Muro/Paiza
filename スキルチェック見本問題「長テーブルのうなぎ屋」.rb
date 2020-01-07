table,num = gets.split(" ").map(&:to_i)
table_result = [*1..table]
table = [*1..table]

(1..num).each do |i|
  people,start = gets.split(" ").map(&:to_i)
  people.times do |j|

    if start > table.size
        start = 0
    end
    
    if table[start] != "x"
        table[start] = "x"
    else
        table = table_result.dup
        break
    end

    if j == people - 1
        table_result = table.dup
    end
    start += 1
  end
end

p table_result.count("x")