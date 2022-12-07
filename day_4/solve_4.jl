input_lines = readlines("day_4/input.txt")

pairs = []
result_1 = 0
result_2 = 0

for l in input_lines
    pair_string = split(l, ',')
    pair = [[parse.(Int, x) for x in split(pair_string[1],'-')], [parse.(Int, x) for x in split(pair_string[2],'-')]]
    if (pair[1][1] <= pair[2][1] && pair[1][2] >= pair[2][2]) ||
        (pair[2][1] <= pair[1][1] && pair[2][2] >= pair[1][2]) 
        global result_1 += 1
    end
    if (pair[1][1] <= pair[2][1] && pair[1][2] >= pair[2][1]) ||
        (pair[2][1] <= pair[1][1] && pair[2][2] >= pair[1][1]) 
        global result_2 += 1
    end
    push!(pairs, pair)
end

println(result_1)
println(result_2)


