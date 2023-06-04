### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 3555c3fc-004e-11ee-087d-f5b778758bc7
using Pkg; Pkg.activate("..")

# ╔═╡ a20a52c0-d1d9-467e-b019-9b70fb031765
md"""
# Breadth First search on a graph
"""

# ╔═╡ ad333459-195c-4a7e-96bb-b3962a170414
#include("../misc/BFS.jl")

# ╔═╡ 66abce54-0c79-422d-ada6-e6301838f334
function bfs(E, V, s)
    """
        Breadth first search. Given a directed graph G = (V, E) and some node metadata, and a search expression it looks for that expression on the graph.
    """
	visited = [false for i in V]
	queue = []
	push!(queue, s)
	visited[s] = true
	MST = []
	while  !isempty(queue)
		y = popfirst!(queue)
		for edge in E
			if edge[1] == y && !visited[edge[2]]
				push!(queue, edge[2])
				visited[edge[2]] = true
				push!(MST, edge)
		
			end
		end
		
    end
	return MST
end

# ╔═╡ 711fd1b0-cb3e-402f-85ad-dae775a9f3eb
V = [1, 2, 3, 4, 5]

# ╔═╡ c7546420-a359-4a74-b477-049cbbe9f998
E = [(1, 2), (2, 1), (1, 3), (2, 3), (2, 4), (3, 5), (4, 5)]

# ╔═╡ e4ed7e2f-abfc-4282-8f9f-4467aa33102f
bfs(E, V, 2)

# ╔═╡ b76a6bdd-1e23-423b-ac53-79929ff1c2b9


# ╔═╡ Cell order:
# ╟─a20a52c0-d1d9-467e-b019-9b70fb031765
# ╠═3555c3fc-004e-11ee-087d-f5b778758bc7
# ╠═ad333459-195c-4a7e-96bb-b3962a170414
# ╠═66abce54-0c79-422d-ada6-e6301838f334
# ╠═711fd1b0-cb3e-402f-85ad-dae775a9f3eb
# ╠═c7546420-a359-4a74-b477-049cbbe9f998
# ╠═e4ed7e2f-abfc-4282-8f9f-4467aa33102f
# ╠═b76a6bdd-1e23-423b-ac53-79929ff1c2b9
