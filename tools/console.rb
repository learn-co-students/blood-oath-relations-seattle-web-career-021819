require_relative '../config/environment.rb'
require 'time'

def reload
  load 'config/environment.rb'
end

# tester=Cult.new(1,2,3,4)
# person=Follower.new("a","b","c")


# tester2=Cult.new(10,11,12,13)
# person.join_cult(tester2)
# tester2.members



# Cult.all




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
