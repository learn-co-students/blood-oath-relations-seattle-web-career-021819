class BloodOath
  attr_accessor :cult, :follower, :intiation_date
  @@all = []

  def initialize(cult, follower, intiation_date=2019)
    @cult = cult
    @follower = follower
    @intiation_date = intiation_date
    @@all << self
  end

  def self.first_oath
    oaths_by_date = self.all.sort_by {|oath| oath.intiation_date}
    oaths_by_date[0].follower
  end

  def self.all
    @@all
  end

end
