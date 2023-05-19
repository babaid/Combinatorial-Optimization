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


#Kruskal

function check_for_cycle()
end

function mst_kruskal()
end






function make_symmetric_matrix(mat)
  """ Just a convenient function to make your adjacency matrix symmetric if you have written
      it by hand.
      """
  N = size(mat)[1]
  for i in 1:N
    for j in 1:N
      if g[i, j]==Inf
        g[i, j] = g[j, i]
      elseif g[j, i] == Inf
        g[j, i] = g[i, j]
      end
    end
  mat
end

















