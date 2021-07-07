class Cult

  attr_reader :name, :location, :founding_year, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    BloodOath.new(follower, self)
  end

  def members
    BloodOath.all.select do |bo|
      bo.cult == self
    end
  end

  def cult_population
    self.members.length
  end

  def self.find_by_name(name)
    BloodOath.all.each do |bo|
      if bo.cult.name == name
        return bo.cult
      end
    end
  end

  def self.find_by_location(name)
    arr = []
    BloodOath.all.each do |bo|
      if bo.cult.location == name
        arr << bo.cult
      end
    end
    arr.uniq
  end

  def self.find_by_founding_year(num)
    arr = []
    BloodOath.all.each do |bo|
      if bo.cult.founding_year == num
        arr << bo.cult
      end
    end
    arr.uniq
  end

  def average_age
    x = self.members.map do |bo|
      bo.follower.age
    end
    x.inject{ |sum, el| sum + el }.to_f / x.size
  end

# REVISIT - Print out motto on
# separate lines?
  def my_followers_mottos
    x = self.members.map do |bo|
      bo.follower.life_motto
    end
    x.each do |motto|
      puts motto
    end
    return nil
  end

  def self.least_popular
    min = 100
    loser = nil
    Cult.all.each do |cult|
      if cult.cult_population < min
        min = cult.cult_population
        loser = cult.name
      end
    end
    loser
  end

  def self.common_location
    hash = {}
    Cult.all.each do |cult|
      if hash[cult.location]
        hash[cult.location] += 1
      else
        hash[cult.location] = 1
      end
    end
    hash
  end

  def self.most_common_location
    most = 0
    common_loc = nil
    self.common_location.each do |k,v|
      if v > most
        common_loc = k
        most = v
      end
    end
    common_loc
  end

end
