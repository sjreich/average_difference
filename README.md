# Average Difference Algorithm

These are a couple little algorithms for finding the average distance between values in a set of values.

For instance, the average distance for a set of points `[1, 2, 3]` would be 4/3.  That's because there are 3 sets of differences to consider:
```ruby
[1, 2] => 1
[1, 3] => 2
[2, 3] => 1
```
and the sum of those differences if 4.

## Brute Force

The brute force approach would be to find the distance between every pair of values, and take the average of those.  That runs in O(n<sup>2</sup>) time.

## Clustering

A smarter approach, very roughly, is to create clusters of values and calculate the distances between those clusters.

In a bit more detail, you only directly calculate the distance between each point and one of its neighbors.  Then you treat each pair of points as a cluster, and find the distance to the next neighboring cluster.  Then you do the same with each cluster of four points, then eight, and so on until you've got them all in a single cluster.

This runs in O(n) time.

## Snowball

This also runs in O(n) time, but it's significantly faster than the last one.

The idea here is basically to only have a single cluster, that grows to represent more and more data, as you loop *once* over the whole data set.
