input_lines = readlines("day_6/input.txt")

line = input_lines[1] # only one line of data
check_array = []
count = 0
found_sop = false
found_som = false

function check_n_distinct_characters(charlist, n)
    return length(charlist) >= n && length(unique(charlist[end-n+1:end])) == n
end

for c in line
    push!(check_array, c)
    global count += 1
    if !found_sop && check_n_distinct_characters(check_array, 4)
        println("start of packet: ", count)
        global found_sop = true
    end
    if !found_som && check_n_distinct_characters(check_array, 14)
        println("start of message: ", count)
        global found_som = true
    end
end

