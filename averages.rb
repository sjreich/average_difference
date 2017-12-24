require 'pry'

class AverageDistance
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers.to_a.sort
  end

  def by_brute_force
    combinations = numbers.combination(2)

    total_distance = combinations.reduce(0) do |total, (first_value, second_value)|
      new_distance = second_value - first_value
      total + new_distance
    end

    total_distance.to_f / combinations.size
  end

  def the_fast_way
    restructured_input = numbers.map do |i| 
      {
        count: 1,
        value: i,
        distance: 0,
      }
    end
    total_distance = fast_total_distance(restructured_input)[:distance]
    total_distance.to_f / numbers.combination(2).size
  end

  private

  def fast_total_distance(data)
    size = data.size
    return data.first if size == 1

    halfway_point = (size / 2.0).ceil
    first_half_of_input = data[0...halfway_point]
    second_half_of_input = data[halfway_point...size]

    first_results = fast_total_distance(first_half_of_input)
    second_results = fast_total_distance(second_half_of_input)

    sum_of_previous_counts = first_results[:count] + second_results[:count]
    sum_of_previous_distances = first_results[:distance] + second_results[:distance]
    distance_between_clusters = second_results[:value] - first_results[:value]
    num_of_connections_between_clusters = first_results[:count] * second_results[:count]
    weighted_average_of_previous_values = 
      (
        first_results[:value] * first_results[:count] + 
        second_results[:value] * second_results[:count]
      ) / sum_of_previous_counts.to_f

    {
      count: sum_of_previous_counts,
      value: weighted_average_of_previous_values,
      distance: sum_of_previous_distances + distance_between_clusters * num_of_connections_between_clusters,
    }
  end
end

puts 'The Fast Way'
[
  10,
  100,
  1000,
  10000,
  100000,
  1000000,
].each do |size|
  input = 1..size
  puts '---------'
  puts "Input Size: #{input.size}"
  t1 = Time.now
  result = AverageDistance.new(input).the_fast_way
  t2 = Time.now
  puts "Time: #{t2 - t1} seconds"
  puts "Average Distance: #{result}"
end

puts "\n\n"

puts 'Brute Force'
[
  10,
  100,
  1000,
  10000,
].each do |size|
  input = 1..size
  puts '---------'
  puts "Input Size: #{input.size}"
  t1 = Time.now
  result = AverageDistance.new(input).by_brute_force
  t2 = Time.now
  puts "Time: #{t2 - t1} seconds"
  puts "Average Distance: #{result}"
end




