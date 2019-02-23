class Cult
  attr_accessor :name, :location, :founding_year, :slogan
  @@all = []

    def initialize(name, location, founding_year, slogan)
      @name = name
      @location = location
      @founding_year = founding_year
      @slogan = slogan
      @@all << self
    end

    def followers
      oaths = BloodOath.all.select {|oath| oath.cult == self}
      oaths.map {|oath| oath.follower}
    end

    def cult_population
      followers.count
    end

    def recruit_follower(follower)
      BloodOath.new(self, follower)
    end

    def average_age
      sum = 0
      self.followers.each do |follower|
        sum += follower.age
      end

      sum/followers.count
    end

    def my_followers_mottos
      followers.each do |follower|
        puts follower.life_motto
      end
    end

    def self.least_popular
      tally = {}
      self.all.each do |cult|
        tally[cult] ||= cult.cult_population
      end

      tally.each do |key, val|
        if val == tally.values.min
          return key.name
        end
      end
    end

    def self.most_common_location
      most_common = nil
      tally = {}
      self.all.each do |cult|
        tally[cult.location] ||= 0
        tally[cult.location] += 1

        most_common ||= cult.location
        if tally[cult.location] > tally[most_common]
          most_common = cult.location
        end
      end

      most_common
    end

    def self.find_by_name(name)
      self.all.select {|cult| cult.name == name}
    end

    def self.find_by_location(location)
      self.all.select {|cult| cult.location == location}
    end

    def self.find_by_found_year(found_year)
      self.all.select {|cult| cult.found_year == found_year}
    end

    def self.all
      @@all
    end
end
