# I think this library can be found at http://www.caliban.org/ruby/ruby-dict.shtml#overview
require 'dict'

dict = DICT.new('dict.org', DICT::DEFAULT_PORT)
dict.client('a Ruby/DICT client')
definitions = dict.define(DICT::ALL_DATABASES, 'antidisestablishmentarianism')
# definitions = dict.define('eng-fra', 'pig')

# dict.show_db.each do |key, value|
#   puts key
#   puts value
#   puts "--------------\n"
# end

puts definitions.size
puts "\n\n"

if definitions
  definitions.each do |d|
    # printf("From %s [%s]:\n\n", d.description, d.database)
    d.definition.each { |line| print line }
    puts "----------------------------------------------------------\n\n\n"
  end
end

dict.disconnect