require 'benchmark'
Benchmark.bm do |x|
  threes = 0
  fives = 0
  fifteens = 0
  x.report {
    0.step(100000000, 3) { |x| threes+=x }
    0.step(100000000, 5) { |x| fives+=x }
    0.step(100000000, 15) { |x| fifteens+=x }
  }
  puts threes + fives - fifteens

end

Benchmark.bm do |x|
  total = 0
  x.report {
    (0..100000000).each do |number|
      if number % 3 == 0 || number % 5 == 0
        total += number
      end
    end
  }
  puts total
end

a = 0
Benchmark.bm do |x|
  x.report {
    a = 3*(100000000/3)*(1+(100000000/3))/2 + 5*(100000000/5)*(1+(100000000/5))/2 - 15*(100000000/15)*(1+(100000000/15))/2
  }
end
puts a


#result
#khanhbq@khanhbq:~/projects/euler$ ruby problem1.rb
#       user     system      total        real
#       3.280000   0.000000   3.280000 (  3.281752)
#       2333333416666668
#       user     system      total        real
#       10.520000   0.000000  10.520000 ( 10.516234)
#       2333333416666668
#       user     system      total        real
#       0.000000   0.000000   0.000000 (  0.000003)
#       2333333416666668
