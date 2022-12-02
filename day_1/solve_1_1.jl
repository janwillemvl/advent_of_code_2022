input_lines = readlines("day_1/input.txt")

calories = []
current_calories = 0
for l in input_lines
    if isempty(l)
        append!(calories, current_calories)
        global current_calories = 0
    else
        global current_calories += parse(Int64, l)
    end
end

calories = sort(calories, rev=true)[begin:3]
print(sum(calories))


