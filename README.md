# Average Difference Algorithm

This is a little algorithm for finding the average distance between values in a set of values.

For instance, the average distance for a set of points `[1, 2, 3]` would be 4/3 (or 1.333..).  That's because there are 3 sets of differences to consider:
```ruby
[1, 2] => 1
[1, 3] => 2
[2, 3] => 1
```
and the sum of those differences if 4.

What's in here shows a brute force approach, which runs in O(n) time.  It also shows a smarter approach, which runs in O(n log(n)) time.

Roughly, the idea is: instead of calculating every distance directly, instead create clusters of values, and then calculate the distances between those clusters.
