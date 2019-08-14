

class Follower
    attr_accessor :name, :age, :life_motto
    @@all=[]
    def initialize (name, age, motto)
        @name=name
        @age=age
        @life_motto=motto
        @@all << self
    end

    def cults
        all_cults=[]
        BloodOath.all.each do |oath|
            if oath.follower==self
                all_cults << oath.cult
            end
        end
        all_cults
    end

    def join_cult (cult)
        cult.members.push(self)
        BloodOath.new(self, cult)
    end

    def self.all 
        @@all
    end

    def self.of_a_certain_age (age)
        @@all.select do |follower|
            follower.age>=age
        end
    end 


end