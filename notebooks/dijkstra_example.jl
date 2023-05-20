### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 7da1b52c-f701-11ed-1738-cf236c2597ac
using LinearAlgebra

# ╔═╡ fd7e1eb1-7517-4f7a-85a1-ff4c1d7a1aa1
include("../ShortestPaths/Dijkstra.jl")

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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.7.0+0"
"""

# ╔═╡ Cell order:
# ╠═7da1b52c-f701-11ed-1738-cf236c2597ac
# ╠═fd7e1eb1-7517-4f7a-85a1-ff4c1d7a1aa1
# ╠═11244dda-1ef2-4339-bc1e-abc27d759e31
# ╠═3af4adb1-d57c-4d6a-ab09-efdc96996692
# ╠═131b0444-b005-4217-8a4c-e2d9e74271ae
# ╠═00e990bf-fbc6-49a2-a045-7036a8d0279d
# ╠═f078f07d-63b4-40ba-8d90-0f01c5dd3489
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
