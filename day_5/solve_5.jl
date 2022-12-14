input_lines = readlines("day_5/input.txt")

stacks_1 = Dict()
stacks_2 = Dict()
stacked = false
stack_pattern = r"[A-Z]"
instruction_pattern = r"\d+"

for l in input_lines
    if isempty(l)
        global stacked = true
        global stacks_2 = deepcopy(stacks_1)
    elseif stacked
        (crates, from, to) = [parse(Int, x.match) for x in eachmatch(instruction_pattern, l)]
        crates_to_move = []
        for i in 1:crates
            crate_1 = popfirst!(stacks_1[from])
            crate_2 = popfirst!(stacks_2[from])
            prepend!(stacks_1[to], [crate_1])
            push!(crates_to_move, crate_2)
        end
        prepend!(stacks_2[to], crates_to_move)
    else
        for x in eachmatch(stack_pattern, l)
            stack_nr = (x.offset + 2) / 4
            if !haskey(stacks_1, stack_nr)
                stacks_1[stack_nr] = [x.match]
            else
                push!(stacks_1[stack_nr], x.match)
            end

        end
    end
    
end

println(stacks_1)
println(join([stacks_1[i][1] for i in 1:length(stacks_1)]))

println(stacks_2)
println(join([stacks_2[i][1] for i in 1:length(stacks_2)]))