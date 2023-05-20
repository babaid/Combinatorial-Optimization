# A simple implementation of Prim's and Kruskal's algorithm on a graph.



function mst_prim_undirected(adj_mat::Matrix{Float})
  """ Prim's algorithm on an adjacency matrix of an undirected weighted graph G.
      
      It follows a visual solution of the problem.
      Adjacency Matrix A[i, j] = weight of connection between nodes i and j
      Algorithm:

        Step 1: Choose a random starting node i
                T:={V(G)_i, \emptyset}
        Step 2: Find minimum weight leaving i ---> j = argmin(A[i, :])
        Step 3-4: Remove A[:, i] from the column search space
                  Add the newly acquired row of node j to the row search
                  space (in literature this is referred to as \delta(V(T))=Outgoung edges from the Tree T to the graph G )
        Step 5: Find lowest weight in the resulting submatrix of A where you look in the rows of the nodes contained in G,
                while not considering intersections with columns of the nodes which are already in T
        Repeat this until V(T) = V(G), (every node of G is also found in T)
        
    For this whole thing to work the elements A[i, j] of the adj. matr. have to be 
    set to A[i, j] = Inf if they are not connected, which makes sense.

"""
  T = []
  N = size(adj_mat)[1]
  
  #Check if there are unconnected nodes and return 0 if there are any
  for row in 1:N
    if iszero(adj_mat[i, :])
      return 0
    end
  end

  rows = rand(1:N, 1)
  next_edge = argmin(adj_mat[rows[1], :])
  done_cols = [rows[1]]

  while length(done_cols) <= N

    cols = [c for c in 1:N if !in(c, done_cols)]
    
    next_edge = argmin(adj_mat[rows, cols])

    push!(T, rows[next_edge[1]], cols[next_edge[2]])
    push!(done_cols, cols[next_edge[2]])
    push!(rows, done_cols[end])
  end
  return T
end


# Kruskal's algrothim works by sorting the edges of the graph into ascending
# order by their weights, and then adding edges one by one to the tree T,
# If there is a cycle on the graph, the edge gets thrown away and the algorithm
# continues until V(T)=V(G)
#
# The tricky part is implementing a recursive check for cycles on the graph.
# In this case it is easier to work with the edge list + node list + weight list representation

function check_for_cycle_at(E, v, visited, parent_node=-1)
  """ Checks for a cycle containing node v

  """
  visited[v] = true
  for (i, edge) in enumerate(E)
    if edge[1] == v
      if !visited[edge[2]]
        if check_for_cycle_at(E, edge[2], visited, parent_node)
          return true
        end
	    else 
        return true 
      end
	
    end
  end  
  return false
end


function check_for_any_cycle(E, V)
  for v in V
    if check_for_cycle_at(E, v, [false for i in V], v)
      return true
    end
  end
  return false
end

function mst_kruskal(adj_mat)
  """
    Kruskal's algorithm on a graph
  """
  E_G = findall(x->x .!= Inf, adj_mat)
  V_G = collect(1:size(adj_mat)[1])
  W_G = [adj_mat[e] for e in E]

  #sort by weights
  perm = sortperm(weights)

  sorted_W = W[perm]
  sorted_E = E[perm]

  E_T = []
  V_T = []
  W_T = []
  for i in 1:length(E_G)
    if length(V_T) != length(V_G)
      push!(E, sorted_E[i])
      push!(V_T, sorted_E[i][1])
      push!(W_T, sorted_W[i])
      if check_for_any_cycle(E_T, V_G)
        pop!(E_T)
        pop!(V_T)
        pop!(W_T)
      end
    else
      break
    end
  end

  return E_T, W_T
end


#If you want to try it here are some matrices
"""
testmatrix1 = [ 
                Inf 1 1 1 1;
                Inf Inf 3 Inf 2;
                Inf Inf Inf 4 Inf;
                Inf Inf Inf Inf 5;
                Inf Inf Inf Inf Inf
              ] # solution should be a star from edge 1 to every other edge

directedtestmatrix = [
                        Inf 0.5 Inf 2 1;
                        Inf Inf 3 Inf 2;
                        Inf Inf 1 4 Inf;
                        Inf Inf Inf Inf 5;
                        Inf Inf Inf Inf Inf
                    ] # may lead to a solution that is not traversable --> use Chi-Liu/Edmonds algorithm for directed graphs

"""

function make_symmetric_matrix(mat)
  """ Just a convenient function to make your adjacency matrix symmetric if you have written
      it by hand.
      """
  N = size(mat)[1]
  for i in 1:N
    for j in 1:N
      if mat[i, j]==Inf
        mat[i, j] = mat[j, i]
      elseif mat[j, i] == Inf
        mat[j, i] = mat[i, j]
      end
    end
  mat
end

function adj_mat_to_lists(adj_mat)
  N = size(adj_mat)[1]
  V = collect(1:N)
  E = []
  W = []
  for i in 1:N
    for j in 1:N
      if adj_mat[i, j] != Inf
        push!(E, (i, j))
        push!(W, adj_mat[i, j])
      end
    end
  end
  return V, E, W
end




