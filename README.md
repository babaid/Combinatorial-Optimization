# Combinatorial-Optimization
## Introduction
This repository contains some combinatorial optimization algorithms on graphs implemented by me. I try to also include intuitive explanations and resources to get more into the topic.
Most of the algorithms I try to implement from scratch, not using any third-party libraries, this way its maybe more challenging but also more valuable.
I intend not to use libraries for Graphs also for this same reason.


The basic problems which I want to solve in this repo are the following:
+ Shortest Path problems (Dijkstra, etc.)
+ Minimum Spanning Tree (MST) problems (Prim, Kruskal)
+ Maximum Flow problems
+ Minimum Flow problems

# On representations of graphs
Assuming some prior mathematical knowledge of graphs, in practice A graph G can be usually be represented in three ways:
1. Node List & Edge List & Edge Weight List 
    + $V(G) = \set{ v |\text{ v is a node in G} \}$
    + $E(G) = \set{(i, j) |\text{ if }v_i \in \text{ G is connected to }v_j \in G}$
    + $W(G) = \set{w_i(e_i) | \text{ for }e_i\in E(G) }$

2. Edge Index & Edge Weights

    + $E(G) \in \mathbb{N}^{2xn}$, where $E[1, :]$ := Starting nodes of edges, $E[2,:]$ := Nodes that the edges point to
    + $W(G)\in \mathbb{R^{1xn}}$, where $W[i]$ corresponds to the weight of edge $E[:, i]$

3. Adjacency Matrix
    + $A\in\mathbb{R^{NxN}}$, where if it is a weighted graph:
    + $A_{i, j}$ = $W[i, j]$ if nodes i and j are connected, else Inf
and for a graph without weights
    + $A_{i, j}$ = 1 if nodes i and j are connected, else 0
can also work.


Each representation has its advantages and disadvantages. The second representation is usually used in libraries (e.g. PyTorch Geometric) as it is sparse, therefore computationally less expensive than the others. Whereas some problems are easier to understand/visualize on an adjacency matrix, others can be implemented easier in the more mathematical formulation (1.).

