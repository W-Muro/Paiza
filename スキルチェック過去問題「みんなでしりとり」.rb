#人数 N
#単語数 K
#log数 M

a = gets.split(" ").map(&:to_i)
N = a[0]
K = a[1]
M = a[2]

list = []
(0..K - 1).each do |i|
    list[i] = gets.chomp
end

mem = []
j = 1
(0..N - 1).each do |i|
    mem[i] = j
    j += 1
end

answer_person = 0
before_word = ""

(1..M).each do |i|
    if answer_person >= mem.size
        answer_person = answer_person % mem.size
    end
    
    word = gets.chomp
    if list.include?(word) && word.slice(-1) != "z"
        list.delete(word)
    elsif word.slice(-1) == "z"
        mem.delete_at(answer_person)
        list.delete(word)
        before_word = ""
        next
    else
        mem.delete_at(answer_person)
        list.delete(word)
        before_word = ""
        next
    end
    
    if before_word.empty?
        before_word = word
    elsif before_word && before_word.slice(-1) == word.slice(0)
        before_word = word
    elsif before_word && before_word.slice(-1) != word.slice(0)
        mem.delete_at(answer_person)
        before_word = ""
        next
    end
    answer_person += 1
end
        

puts mem.size
puts mem