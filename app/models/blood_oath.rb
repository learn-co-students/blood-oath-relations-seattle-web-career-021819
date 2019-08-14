class BloodOath
    @@all=[]
    attr_reader :initiation_date, :follower, :cult

    def initialize (follower, cult)
        @initiation_date= "#{Time.now.year}"
        @follower=follower
        @cult=cult

        @@all << self
    end

    def self.all
        @@all
    end

end