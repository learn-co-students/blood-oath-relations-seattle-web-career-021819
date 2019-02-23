require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

bob = Follower.new("Bob", 21, "Hello")
chris = Follower.new("Chris", 40, "I'm joining a cult!")
marilyn = Follower.new("Marilyn Manson", 50, "I'm GOD")

witches = Cult.new("Witches", "Salem", 1776, "Fly my monkeys")
mansons = Cult.new("Mansons", "Los Angeles", 1990, "Cut yourself")
hippies = Cult.new("Hippies", "Los Angeles", 1970, "Peace & Love")

witches.recruit_follower(bob)
witches.recruit_follower(chris)
mansons.recruit_follower(marilyn)


BloodOath.all
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
