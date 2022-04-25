# TestYourConcepts

Consider the 3-means algorithm on a set S consisting of the following 6 points in the plane: a= (0,0), b = (8,0), c=(16,0), d=(0,6), e=(8,6), f=(16,6). The algorithm uses the Euclidean distance metric to assign each point to its nearest centroid; ties are broken in favor of the centroid to the left/down. A starting configuration is a subset of 3 starting points from S that form the initial centroids. A 3-partition is a partition of S into 3 subsets; thus {a,b,e}, {c,d}, {f} is a 3-partition; clearly any 3-partition induces a set of three centroids in the natural manner. A 3-partition is stable if repetition of the 3-means iteration with the induced centroids leaves it unchanged.
a. How many starting configurations are there?
b. What are the stable 3-partitions?
c. What is the number of starting configurations leading to each of the stable 3-partitions in (b) above?
d. What is the maximum number of iterations from any starting configuration to its stable 3-partition?
