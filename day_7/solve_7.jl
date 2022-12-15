input_lines = readlines("day_7/input.txt")

dir_dict = Dict()
file_pattern = r"(\d+) .+"
dir_pattern = r"\$ cd (.+)"
up_pattern = r"\$ cd \.\."
parent_dirs = []
parent_paths = []
count = 0
for l in input_lines
    global count+=1
    m = match(up_pattern, l)
    if ! (m === nothing)
        if length(parent_dirs) === 0
            println(count)
        else
            pop!(parent_dirs)
            pop!(parent_paths)
        end
    else
        m = match(dir_pattern, l)
        if ! (m === nothing)
            dir = m.captures[1]
            push!(parent_dirs, dir)
            path = join(parent_dirs, "/")
            push!(parent_paths, path)
            global dir_dict[path] = 0
        else
            m = match(file_pattern, l)
            if ! (m === nothing)
                size = parse(Int, m.captures[1])
                for path in parent_paths
                    global dir_dict[path] += size
                end
            end
        end
    end
end

available_space = 70000000 - dir_dict["/"]
needed_space = 30000000 - (available_space)
println(needed_space)

total_small_dir_size = 0
smallest_applicable_dir = ""
smallest_applicable_dir_size = 70000000
for (d, v) in dir_dict
    if v <= 100000
        global total_small_dir_size += v
    end
    if v >= needed_space && v < smallest_applicable_dir_size
        println(d, " ", v)
        global smallest_applicable_dir_size = v
        global smallest_applicable_dir = d
    end
end
println(total_small_dir_size)
println(smallest_applicable_dir_size)

