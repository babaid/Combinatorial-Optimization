### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ f5e813e2-4765-456c-8b24-574944e5cc17
using Pkg; Pkg.activate("..")

# ╔═╡ 1494fbd9-58b8-4254-b367-35456535ac88
using LinearAlgebra, Images

# ╔═╡ 97152bce-a16e-4220-9457-09528c4d70d5
include("../Network Flows/MaximumFlow.jl")

# ╔═╡ 4a487369-fd0b-4e0e-b48b-cadf4797b0a6
g = [ 	0. 3 0 4 0 0;
		0. 0 2 0 0 0;
		0. 0 0 0 1 2;
		0. 0 1 0 3 0;
		0. 0 0 0 0 5;
		0  0 0 0 0 0 
]

# ╔═╡ 21b1b022-2f03-472c-a2a4-9c86a3d44021
md"""The given graph can be seen below. It is easy to check what the maximum flow is going to be, even by hand. It is going to be val(f) = 6."""

# ╔═╡ 5286ebde-b8ea-4d99-a200-1a8ef36bde48
load("_images/mf.png")

# ╔═╡ fa45e01d-f9bc-4778-91a3-524365f3c0e4
md"""And it isn't surprising that the Edmonds-Karp algorithm finds this result:"""

# ╔═╡ 2b79e786-9aa7-4b2f-a240-19410ac759c3
EdmondsKarp(g, 1, 6)

# ╔═╡ 7b21866e-18ef-4a45-be47-a0e7654474db
md"""Lets also check an even easier maximum flow, between vertices 1 and 3 for example: """

# ╔═╡ 21b2fc1d-8cf4-4f44-82a1-29f4f6797d41
EdmondsKarp(g, 1, 3)

# ╔═╡ 5b90df09-b888-4e7f-bfc5-5955fc1f07fa
md""" Now we do the same with the Ford-Fulkerson algorithm, wich also works but much slower."""

# ╔═╡ 7e013a22-5997-45fa-9904-d28f9cd7871e
FordFulkerson(g, 1, 5)

# ╔═╡ Cell order:
# ╠═f5e813e2-4765-456c-8b24-574944e5cc17
# ╠═1494fbd9-58b8-4254-b367-35456535ac88
# ╠═97152bce-a16e-4220-9457-09528c4d70d5
# ╠═4a487369-fd0b-4e0e-b48b-cadf4797b0a6
# ╟─21b1b022-2f03-472c-a2a4-9c86a3d44021
# ╟─5286ebde-b8ea-4d99-a200-1a8ef36bde48
# ╟─fa45e01d-f9bc-4778-91a3-524365f3c0e4
# ╠═2b79e786-9aa7-4b2f-a240-19410ac759c3
# ╟─7b21866e-18ef-4a45-be47-a0e7654474db
# ╠═21b2fc1d-8cf4-4f44-82a1-29f4f6797d41
# ╟─5b90df09-b888-4e7f-bfc5-5955fc1f07fa
# ╠═7e013a22-5997-45fa-9904-d28f9cd7871e
