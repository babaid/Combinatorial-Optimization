"""
    This file contains implementations of the Ford-Fulkerson and the Edmonds-Karp algorithms.
    The only difference between these two is the algorithm for searching for augmenting paths in the residual network.
    While the Ford-Fulkerson algorithm uses Depth-First-Search (DFS), which does not gives necessarily the shortest path between two points, the Edmonds-Karp
    algorithm uses Breadth-First Search (BFS), which gives a shortest path in an unweighted digraph.

    Again the operations are implemented using adjacency matrices, as you will see it makes things much easier.
    Three matrices will be used. The matrix for the graph where the entries are capacitries, A matrix for
    the residual graph similar to the previous one, and another matrix containing the flows.

    I wouldnt really try to execute the Ford-Fulkerson algorithm, as it is unstable in many cases (see in literature).

"""

using LinearAlgebra

function find_path_dfs(adj_mat, s, t)

    N = size(adj_mat)[1]
    stack = [s]
    visited = [false for i in 1:N]
    visited[s] = true 
    parents = [0 for i in 1:N]
    
    while !isempty(stack)
        v = popfirst!(stack)
        neighbors = findall(!iszero, adj_mat[v, :])
        for neighbor in neighbors
            parents[neighbor] = v
            if !visited[neighbor]
                visited[neighbor] = true
            end
            if neighbor == t
                u = t
                path = []
                while u != 0
                    push!(path, u)
                    u = parents[u]
                    
                end
                return reverse(path)
            end
            push!(stack, neighbor)
        end
    end
    return 0
end

function find_path_bfs(adj_mat, s, t)
	N = size(adj_mat)[1]
	visited = [false for i in 1:N]
	queue = []
	push!(queue, s)
	visited[s] = true
	parents = [0 for i in 1:N]
	while  !isempty(queue)
		y = popfirst!(queue)
		neighbors = findall(!iszero, adj_mat[y, :])
		for neighbor in neighbors
			if !visited[neighbor]
				parents[neighbor] = y
				push!(queue, neighbor)
				visited[neighbor] = true
				if neighbor == t
					u = t
					path = []
					while u !=0
						push!(path, u)
						u = parents[u]
					end
					return reverse(path)
				end
			end
		end
		
    end
	return 0
end


function create_residual_graph(adj_mat, f_mat)
	forward = ifelse.(f_mat.>0, adj_mat.-f_mat, adj_mat)
	temp = ifelse.(transpose(f_mat) .> 0, transpose(f_mat), Inf)
	backward = ifelse.(temp .< transpose(adj_mat), transpose(adj_mat).-temp, 0 )
	return forward .+ backward
end


function FordFulkerson(g, s, t )
	f = zeros(size(g))
	gf = create_residual_graph(g,f)
	while !iszero(find_path_dfs(gf, s, t))
		
        vertex_path = find_path_dfs(gf, s, t)
        edge_path = [CartesianIndex(vertex_path[i], vertex_path[i+1]) for i in 1:length(vertex_path)-1]
		
        gamma = minimum(ifelse.(gf[edge_path, :] .> 0, gf[edge_path, :], Inf))
		#augment flow along path
        f[edge_path] .+= gamma
		#update residual graph
        gf = create_residual_graph(g, f)
	end

    #calculate and return maximum flow on the graph; back edges are negative, forward edges positive.
    maxflow  = sum(ifelse.(g[:, t].<f[:, t], -f[:, t], f[:, t]))
	return maxflow
	
end

function EdmondsKarp(g, s, t )
	f = zeros(size(g))
	
	gf = create_residual_graph(g,f)
	
	while !iszero(find_path_bfs(gf, s, t))

		vertex_path = find_path_bfs(gf, s, t)
        edge_path = [CartesianIndex(vertex_path[i], vertex_path[i+1]) for i in 1:length(vertex_path)-1]
		
        gamma = minimum(ifelse.(gf[edge_path, :] .> 0, gf[edge_path, :], Inf))
		#augment flow along path
        f[edge_path] .+= gamma
		#update residual graph
        gf = create_residual_graph(g, f)
	end
	#calculate and return maximum flow on the graph; back edges are negative, forward edges positive.
    maxflow  =  sum(ifelse.(g[:, t].<f[:, t], -f[:, t], f[:, t]))
	return maxflow
end