# If you can't install the rubilicious gem, try http://pablotron.org/software/rubilicious/doc/

require 'rubygems'
require 'rubilicious'

u = 'sikelianos'
p = 'secret'
r = Rubilicious.new(u, p)

# r.recent.each do |post|
#   puts post["href"]
#   puts post["tags"].join(" ")
#   puts "\n\n"
# end

# puts r.tags.keys.sort.map { |tag| "#{tag},#{r.tags[tag]}" }.join("\n")
puts r.tags.sort {|a,b| a[1]<=>b[1]}.join("\n") # tags in order from least to most frequent