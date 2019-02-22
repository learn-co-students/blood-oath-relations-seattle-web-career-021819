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
  
end
