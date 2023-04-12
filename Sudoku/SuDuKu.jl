### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d29ad0d1-5d82-4f93-8825-a19152a062f8
global grid = Array(
		[5 3 0 0 7 0 0 0 0;
		 6 0 0 1 9 5 0 0 0;
		 0 9 8 0 0 0 0 6 0;
		 8 0 0 0 6 0 0 0 3;
		 4 0 0 8 0 3 0 0 1;
		 7 0 0 0 2 0 0 0 6;
		 0 6 0 0 0 0 2 8 0;
		 0 0 0 4 1 9 0 0 5;
		 0 0 0 0 8 0 0 7 9;
		]
		 )

# ╔═╡ 946e5304-f879-47b7-a34f-85e0bc1464d0
number_grid = 9

# ╔═╡ be8df267-66b7-4d56-90eb-a7445bd524bc
function possible(x,y,number)
	if any(g->g==number, grid[x,:])
		return false
	elseif any(g->g==number,grid[:,y])
		return false
	else
		
		x_start = fld((x-1),3)*3+1
		x_end = x_start + 2

		y_start = fld((y-1),3)*3+1
		y_end = y_start+2
		return ~any(g->g==number,grid[x_start:x_end,y_start:y_end])
	end
end
	

# ╔═╡ ecef26ae-83d9-49ac-b376-42573b39bc3b
function solve()
	for x in 1:number_grid
		for y in 1:number_grid
			if grid[x,y]==0
				for n in 1:number_grid
					if possible(x,y,n)
						global grid[x,y]=n
						solve()
						global grid[x,y]=0
					end
				end
				return
			end
		end
	end
display(grid)

end

# ╔═╡ 955d071a-7362-42db-93c9-a041e596775f
solve()

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
# ╠═d29ad0d1-5d82-4f93-8825-a19152a062f8
# ╠═946e5304-f879-47b7-a34f-85e0bc1464d0
# ╠═be8df267-66b7-4d56-90eb-a7445bd524bc
# ╠═ecef26ae-83d9-49ac-b376-42573b39bc3b
# ╠═955d071a-7362-42db-93c9-a041e596775f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
