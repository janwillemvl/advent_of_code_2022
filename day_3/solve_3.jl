input_lines = readlines("day_3/input.txt")

rucksacks = []
groups = []
group = []
i = 1

for l in input_lines
    h = Int(length(l)/2)
    compartments = (l[begin:h], l[h+1:end])
    push!(rucksacks, compartments)

    push!(group, l)
    if i == 3
        push!(groups, group)
        global group = []
        global i = 1
    else
        global i += 1
    end
end

function get_letter_value(s)
    n = 0
    if isuppercase(s)
        n = Int(s) - 38
    elseif islowercase(s)
        n = Int(s) - 96
    else
        throw(DomainError(s, "Neither upper nor lower."))
    end
    return n
end

errors = []
for r in rucksacks
    s = intersect(collect(r[begin]), collect(r[end]))[begin]
    err = get_letter_value(s)
    append!(errors, err)
end

badges = []
for g in groups
    b = intersect(g[1], g[2], g[3])[begin]
    append!(badges, get_letter_value(b))
end

println(sum(errors))
println(sum(badges))
