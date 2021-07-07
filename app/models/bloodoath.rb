class BloodOath

  attr_accessor :follower, :cult, :initiation_date

  @@all = []

  def initialize(follower, cult)
    @follower = follower
    @cult = cult
    @initiation_date = Time.now.strftime("%Y-%m-%d")
    @@all << self
  end

  def self.all
    @@all
  end

end
