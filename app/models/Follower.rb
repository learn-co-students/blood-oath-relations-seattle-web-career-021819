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

  def join_cult(cult)
    if self.age >= cult.minimum_age
      BloodOath.new(cult, self)
    else
      "SORRY CHARLIE!"
    end
  end

  def my_cults_slogans
    self.cults.each do |cult|
      puts cult.slogan
    end
  end

  def fellow_cult_members
    fellows = []
    cults.each do |cult|
      cult.followers.each do |follower|
        fellows << follower.name if follower != self
      end
    end

    fellows.uniq
  end

  def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age >= age}
  end

  def self.most_active
    self.all.max_by {|follower| follower.cults.count}
  end

  def self.top_ten
    tally ={}

    self.all.each do |follower|
      tally[follower] = follower.cults.count
    end

    max_list = tally.max_by(10) {|k, v| v}

    max_list.map do |follower|
      follower[0].name
    end
  end

end
