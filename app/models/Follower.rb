class Follower
  attr_accessor :name, :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def cults
    list = BloodOath.all.select {|oath| oath.follower == self}
    list.map {|name| name.cult}
  end

  def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age >= age}
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end

  def my_cults_slogans
    self.cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    tally ={}

    self.all.each do |follower|
      tally[follower] = follower.cults.count
    end
    tally.each do |key, val|
      if val == tally.values.max
       return key
      end
    end
  end

  def self.top_ten
    tally ={}
    top_ten = []

    self.all.each do |follower|
      tally[follower] = follower.cults.count
    end

    list = tally.sort_by {|key, value| value}
    10.times do |index|
      top_ten << list[list.count-1-index][0]
    end

    return top_ten
  end

end
