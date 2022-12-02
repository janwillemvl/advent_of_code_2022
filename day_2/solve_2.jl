input_lines = readlines("day_2/input.txt")

games_1 = []
games_2 = []

game_dict_1 = Dict("A X" => 4, "B X" => 1, "C X" => 7, "A Y" => 8, "B Y" => 5, "C Y" => 2, "A Z" => 3, "B Z" => 9, "C Z" => 6)
game_dict_2 = Dict("A X" => 3, "B X" => 1, "C X" => 2, "A Y" => 4, "B Y" => 5, "C Y" => 6, "A Z" => 8, "B Z" => 9, "C Z" => 7)
for l in input_lines
    score = game_dict_1[l]
    append!(games_1, score)
    score = game_dict_2[l]
    append!(games_2, score)
end

println(sum(games_1))
println(sum(games_2))


