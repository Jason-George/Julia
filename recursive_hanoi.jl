### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 477f6dc5-61e0-4512-af0c-69c601975ae8
function record_move(source,target,counter,moves_dict)
	moves_dict[counter] = (source,target)
	counter +=1
	return moves_dict,counter
end

# ╔═╡ 51f512cb-1250-4ab8-bb72-488011d33c36
function solve_(num_disks, source,intermediate,target,counter,moves_dict)
	if num_disks==0

	else
		#
		moves_dict,counter = solve_(num_disks-1,source,target,
									intermediate,counter,moves_dict)
		moves_dict,counter = record_move(source,target,counter,moves_dict)
		moves_dict,counter = solve_(num_disks-1,intermediate,source,
								target,counter,moves_dict)
	end
	return moves_dict,counter
end

# ╔═╡ c9e0da68-ac32-4245-8c3a-b0293f08b519
function islegal(stacks,all_disks)
	order_correct = all(issorted, stacks)
	
	#check if we use the same disk set that we started with
	
	disks_in_state = sort([disk for stack in stacks for disk in stack])
	disks_complete = disks_in_state == all_disks
	
	order_correct && disks_complete
end

# ╔═╡ 9401d160-e3ad-40ce-9e21-c59f8dc4b83b
function move(stack,source::Int,target::Int,all_disks)
	copy_stacks = deepcopy(stack)
	if length(copy_stacks[source]) !=0
		disk = popfirst!(copy_stacks[source]) #take disk
		pushfirst!(copy_stacks[target], disk) #put on new stack
	end
	if islegal(copy_stacks,all_disks)
		# println(copy_stacks)
		return copy_stacks
	else
		error("Error: ILLEGAL MOVE")
		
	end
end

# ╔═╡ f0e51420-ca0b-4ddd-a5a5-d72f331345ac
function game(stacks,moves_dict,all_disks)
	for n in 0:length(moves_dict)-1
		src, dest = moves_dict[n]
		stacks = move(stacks,src,dest,all_disks)
	end
	return stacks
end

# ╔═╡ 71ce5270-adab-4038-96e2-1927b3b697c8
begin
	num_disks = 7
	moves_dict = Dict()
	counter=0
end

# ╔═╡ 6e865e83-9b51-459c-8782-989da3787bd5
begin
	source=1
	intermediate=2
	target=3
	Moves, num_moves = solve_(num_disks,source,intermediate,target,
							counter,moves_dict)
	
	println("NUMBER OF DISKS: $num_disks")
	println("NUMBER OF MOVES: $num_moves")
end

# ╔═╡ 9e757ca5-e301-44dd-b758-df93082d37a3
begin
	all_disks = 1:num_disks
	first_stack = collect(all_disks)
	starting_stacks = [first_stack, [], []]
end

# ╔═╡ e31220ba-e823-44d1-9d1f-1d5f7ce8aba9
final_stack = game(starting_stacks, Moves,all_disks)

# ╔═╡ a6de883b-81e8-4e10-91e1-a49511eb7a27
md"""
## A Single Function
"""

# ╔═╡ 33c53c02-2a40-47a6-b6ff-99342dc20c4e
function HANOI_GAME(num_disks)
	
	moves_dict = Dict()
	counter = 0
	
	source=1
	intermediate=2
	target=3
	# println(typeof(source))
	MOVES_, num_moves = solve_(num_disks,source,intermediate,target,
										counter,moves_dict)

	all_disks = 1:num_disks
	stack = collect(all_disks)
	starting_stack = [stack, [], []]

    println("STARTING GAME STACK:",starting_stack)
	println("NUMBER OF MOVES:",num_moves)

	final_game_stack = game(starting_stack, MOVES_,all_disks)


	return final_game_stack
end

# ╔═╡ 97520bb3-e718-478f-b479-ebeb5834a937
NUM_DISKS=6

# ╔═╡ f6329b84-870a-4def-9066-d32e5aa49e65
END_STACK = HANOI_GAME(NUM_DISKS)

# ╔═╡ cdde0631-71db-4f42-8192-49d5c2d9a676
println("END GAME STACK:",END_STACK)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═477f6dc5-61e0-4512-af0c-69c601975ae8
# ╠═51f512cb-1250-4ab8-bb72-488011d33c36
# ╠═c9e0da68-ac32-4245-8c3a-b0293f08b519
# ╠═9401d160-e3ad-40ce-9e21-c59f8dc4b83b
# ╠═f0e51420-ca0b-4ddd-a5a5-d72f331345ac
# ╠═71ce5270-adab-4038-96e2-1927b3b697c8
# ╠═6e865e83-9b51-459c-8782-989da3787bd5
# ╠═9e757ca5-e301-44dd-b758-df93082d37a3
# ╠═e31220ba-e823-44d1-9d1f-1d5f7ce8aba9
# ╠═a6de883b-81e8-4e10-91e1-a49511eb7a27
# ╠═33c53c02-2a40-47a6-b6ff-99342dc20c4e
# ╠═97520bb3-e718-478f-b479-ebeb5834a937
# ╠═f6329b84-870a-4def-9066-d32e5aa49e65
# ╠═cdde0631-71db-4f42-8192-49d5c2d9a676
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
