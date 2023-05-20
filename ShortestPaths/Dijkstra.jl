


function Dijkstra(V, E, W, s, t)
    """
        Dijkstra algorithm
    """


    dist = Float64.([Inf for v in V])
    prev = [0 for v in V]
    dist[s] = 0
    Q = copy(V)
	S = []


    while !isempty(Q)
        u = Q[argmin(dist)]
		Q = [v for v in Q if v != u]

		
		for (i, edge) in enumerate(E)
			if edge[1] == u
				if edge[2] in Q    
					alt = dist[edge[1]] + W[i]
					if alt < dist[edge[2]]
						dist[edge[2]] = alt
						prev[edge[2]] = u 
					end
				end
			end

			if u == t
                #stop looking any further when we reached target node t, retrace steps and return path S 
				while prev[u] != 0 || u!=s
					push!(S, u)
					u = prev[u]
				end
				push!(S, s)
				return reverse(S)
			end
			
		end
	
    end
    return -1
end
