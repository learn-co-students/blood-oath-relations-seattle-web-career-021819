require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

flatiron = Cult.new("Flatiron", "Seattle", 1993, "Learn")
code_dojo = Cult.new("Code Dojo", "Portland", 1993, "Code")
ada = Cult.new("Ada", "Seattle", 2002, "Learn to Code")

brian = Follower.new("Brian", 25, "Live life")
kim = Follower.new("Kim", 30, "Woohoo!")
john = Follower.new("John", 29, "Always learn")
mary = Follower.new("Mary", 32, "Always code")
sarah = Follower.new("Sarah", 25, "Live")
tom = Follower.new("Tom", 77, "NEVER TOO LATE!")
jerry = Follower.new("Jerry", 29, "learn")
melissa = Follower.new("Melissa", 27, "Always")
bob = Follower.new("Bob", 23, "WOOT")
steve = Follower.new("Steve", 26, "YAY")
nick = Follower.new("Nick", 35, "SDHJFHSD")

BloodOath.new(flatiron, brian, 2019)
BloodOath.new(code_dojo, brian, 2019)
BloodOath.new(flatiron, kim, 2019)
BloodOath.new(ada, kim, 2019)
BloodOath.new(code_dojo, john, 2017)
BloodOath.new(code_dojo, melissa, 2017)
BloodOath.new(ada, melissa, 2017)
BloodOath.new(flatiron, melissa, 2017)
BloodOath.new(code_dojo, steve, 2017)
BloodOath.new(ada, steve, 2017)
BloodOath.new(code_dojo, bob, 2017)
BloodOath.new(flatiron, tom, 2017)
BloodOath.new(flatiron, jerry, 2019)
BloodOath.new(flatiron, nick, 2019)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
