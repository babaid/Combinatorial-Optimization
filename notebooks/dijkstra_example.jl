### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 79ecfbad-0406-44e9-955e-c9e49179c2ce
using Pkg

# ╔═╡ 7f8cceb5-8bfb-4292-9931-9e55dbb43190
Pkg.activate("../")

# ╔═╡ 7da1b52c-f701-11ed-1738-cf236c2597ac
using LinearAlgebra, Plots

# ╔═╡ fd7e1eb1-7517-4f7a-85a1-ff4c1d7a1aa1
include("../ShortestPaths/Dijkstra.jl")

# ╔═╡ d9c25728-b6e2-40d6-9b27-0f618e82ee66
include("../MinimumSpanningTrees/MinimumSpanningTree.jl")

# ╔═╡ 11244dda-1ef2-4339-bc1e-abc27d759e31
V = collect(1:9)

# ╔═╡ 3af4adb1-d57c-4d6a-ab09-efdc96996692
E = [
	(1, 2), (1, 4), (1, 5),
	(2, 3),
	(3, 6),
	(4, 7),
	(5, 6),(5, 9),
	(6, 9),
	(7, 8),
	(8, 9)
]

# ╔═╡ 131b0444-b005-4217-8a4c-e2d9e74271ae
w = [4, 2., 1, 
	2, 
	3,
	2, 
	1, 4,
	1,
	5,
	5
]

# ╔═╡ 00e990bf-fbc6-49a2-a045-7036a8d0279d
Missing

# ╔═╡ f078f07d-63b4-40ba-8d90-0f01c5dd3489
Dijkstra(V, E, w, 1, 9)

# ╔═╡ a6ca418c-5fbc-4e05-bf7e-fc89a508e0f4
begin
	# generate a random grid of connected nodes
	N = 15
	maze = ones(N*N, N*N)*Inf;
	for i in 1:N*N
		if i<=N*N-N
			maze[i, i+N] = rand()
		end
		if i%N!=0
			maze[i, i+1] = rand()
		end
	end
	mat = make_symmetric_matrix(maze)
	Vm, Em, Wm = adj_mat_to_lists(maze)
end;

# ╔═╡ 9547e822-174e-49f8-92b9-4f274a0b0297
SP = Dijkstra(Vm, Em, Wm, 1, 225)

# ╔═╡ ade1f4d2-2c80-45f8-b227-5abc4b3b1c86
begin
	#create representation of the maze
	maze_repr = zeros(N, N);
	for n in SP
		maze_repr[n] = 1.
	end
	heatmap(maze_repr, showaxis=false, colorbar=false)
	
end

# ╔═╡ Cell order:
# ╠═79ecfbad-0406-44e9-955e-c9e49179c2ce
# ╠═7f8cceb5-8bfb-4292-9931-9e55dbb43190
# ╠═7da1b52c-f701-11ed-1738-cf236c2597ac
# ╠═fd7e1eb1-7517-4f7a-85a1-ff4c1d7a1aa1
# ╠═11244dda-1ef2-4339-bc1e-abc27d759e31
# ╠═3af4adb1-d57c-4d6a-ab09-efdc96996692
# ╠═131b0444-b005-4217-8a4c-e2d9e74271ae
# ╠═00e990bf-fbc6-49a2-a045-7036a8d0279d
# ╠═f078f07d-63b4-40ba-8d90-0f01c5dd3489
# ╠═d9c25728-b6e2-40d6-9b27-0f618e82ee66
# ╠═a6ca418c-5fbc-4e05-bf7e-fc89a508e0f4
# ╠═9547e822-174e-49f8-92b9-4f274a0b0297
# ╟─ade1f4d2-2c80-45f8-b227-5abc4b3b1c86
