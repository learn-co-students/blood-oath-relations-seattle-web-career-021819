class Follower

  attr_reader :name, :age, :life_motto

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
    arr = []
    BloodOath.all.each do |bo|
      if bo.follower == self
        arr << bo.cult
      end
    end
    arr
  end

  def join_cult(cult)
    BloodOath.new(self, cult)
  end

  def self.of_a_certain_age(num)
    arr = []
    BloodOath.all.each do |bo|
      if bo.follower.age >= num
        arr << bo.follower
      end
    end
    arr.uniq
  end

# REVISIT
# def my_cults_slogans

#  def self.most_active

end
