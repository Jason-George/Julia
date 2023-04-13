### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 6c057fe0-d9d3-11ed-014a-a39d259a642d
md"""
Select two numbers P & Q (both should be prime) or select one Number 'N', whose factors(2 prime numbers), we are going to find...
"""

# ╔═╡ bc6f18b9-2bb3-41e5-a299-d87cb9cf2411
begin
	p=13
	q=29
	N = p * q
	println(N)
end

# ╔═╡ c8f89921-b75d-433b-b35c-70bc70863893
md"""
If p & q is selected, and they're prime numbers, then N should have only those 2 numbers as its factors
"""

# ╔═╡ 1324308f-f0d2-4e2f-a9b1-faf2e2c977bf
begin
	#Select a random number betweeb 1 & N
	a = rand(1:N)
	print(a)
end

# ╔═╡ 1a3e67ea-25d1-4ee8-9e04-55694c6a076f
md"""
If we find the Greatest Common Denominator(GCD), between 'a' & 'N' to be other than 1,
then we have found one of the factors of N by chance, otherwise 'a' is a good choice for further calculations
"""

# ╔═╡ 5692da67-6cbe-44c8-89e2-9f4a9435df01
begin
	g = gcd(a,N)
	println(g)
	if g != 1
		println("One of the factors of N: ",g)
	else
		println("No common factors between $(a) & $(N)")
	end
end

# ╔═╡ d300a4e4-6686-49ed-90e1-bd89a309058a
md"""
The Quantum Computing Part
"""

# ╔═╡ d583d0a5-05a3-4ecb-9d9e-c6f024f49092
#Find the period between a mod N
begin
	counter  = 0
	period   = 0
	number_1 = 0
	
	for i in (0:(N-1))
		
		mods = mod(BigInt(a)^i,N)
		global counter +=1
		println(i,'\t',mods,'\t', counter, '\t',number_1)
		if mods==1
			global number_1 +=1
			if number_1 >=3
				global period = ((counter+1)/2) - 1
				break
			end
		end
	end
end

# ╔═╡ 1668bb92-64af-4634-a172-8010426fd523
print("Period:", period)

# ╔═╡ 9be8416b-4893-4763-8694-461ac2641a5a
#The period has to be even
if period%2 !=0
	println("$(period) is not even!")
else
	println("$(period) is even!")
end

# ╔═╡ ce698e69-22d8-4f69-99c7-171db0f44cae
#Check a^(period/2)+1==0
if BigInt(a)^(period/2)+1 ==0
	println("Condition NOT Satisfied!")
else
	println("Condition Satisfied!")
end

# ╔═╡ ad85d2bc-51c5-4d5c-ae18-35390df72041
begin
	x1 = gcd(BigInt(BigInt(a)^((period/2)-1)),N)
	x2 = gcd(BigInt(BigInt(a)^((period/2)+1)),N)
	println(x1,'\t',x2)
end

# ╔═╡ 6632c36f-03c0-4129-88eb-1b093810e4b7
md"""
USING LOOP TO SOLVE

Only Small Numbers for Now
"""

# ╔═╡ e2f817bb-65ec-4780-925e-6b69f980d116
begin
	p2=19
	q2=29
	N2 = p2 * q2
	println(N2)
end

# ╔═╡ 6f8e8d85-b0c6-4f75-8ef5-cb7c96e5a4d3
begin
	g2=0
	while g2!=1
		
		a2 = rand(1:N2)
		global g2 = gcd(a2,N2)
		if g2==1
			counter2=0
			period2=0
			number_2=0
			for i in 0:(N-1)
				mods = mod(BigInt(a2)^i,N2)
				# println(mods)
				counter2 +=1
				if mods==1
					number_2+=1
					if number_2>=3
						period2 = ((counter2+1)/2) - 1
						break
					end
				end
			
			end
			# println("Randon Number $(a2)", '\t', "Period $(period2)")
			if period2<100 && period2%2==0
				x1 = gcd(BigInt(BigInt(a2)^(period2/2)-1),N2)
				x2 = gcd(BigInt(BigInt(a2)^(period2/2)+1),N2)
				println("The 2 factors of N2 are $(x1) & $(x2)")
			else
				global g2=0
			end
		end
		
		
	end
end

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
# ╟─6c057fe0-d9d3-11ed-014a-a39d259a642d
# ╠═bc6f18b9-2bb3-41e5-a299-d87cb9cf2411
# ╟─c8f89921-b75d-433b-b35c-70bc70863893
# ╠═1324308f-f0d2-4e2f-a9b1-faf2e2c977bf
# ╟─1a3e67ea-25d1-4ee8-9e04-55694c6a076f
# ╠═5692da67-6cbe-44c8-89e2-9f4a9435df01
# ╟─d300a4e4-6686-49ed-90e1-bd89a309058a
# ╠═d583d0a5-05a3-4ecb-9d9e-c6f024f49092
# ╠═1668bb92-64af-4634-a172-8010426fd523
# ╠═9be8416b-4893-4763-8694-461ac2641a5a
# ╠═ce698e69-22d8-4f69-99c7-171db0f44cae
# ╠═ad85d2bc-51c5-4d5c-ae18-35390df72041
# ╟─6632c36f-03c0-4129-88eb-1b093810e4b7
# ╠═e2f817bb-65ec-4780-925e-6b69f980d116
# ╠═6f8e8d85-b0c6-4f75-8ef5-cb7c96e5a4d3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
