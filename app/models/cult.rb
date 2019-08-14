class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :members

    @@all=[]

    def initialize (name, location, founding_year, slogan)
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.least_followers
        count={}

        least=nil
        
        BloodOath.all each do |oath|
            if count[oath.cult]==nil
                count[oath.cult]=1
            else
                count[oath.cult]+=1
            end

            if(least==nil)
                least=oath.cult
            elsif count[oath.cult]<count[least]
                least=oath.cult
            end
        end
        least
    end

    def followers
        follow=[]
        BloodOath.select each do |oath|
            if oath.cult==self    
                follow << oath.follower
            end
        end 
        follow
    end

    def average_age
        arr=self.followers
        sum=0.0
        arr.each do |follower|
            sum+=follower.age
        end
        sum/arr.length
    end

    def print_motto
        arr=self.followers
        arr.each do |follower|
            puts follower.motto
        end
    end

    def cult_population
        self.followers.length
    end


     def recruit_follower (follower)
         @members << follower
         BloodOath.new(follower, self)
     end

    def self.find_by_name (name)
        @@all.find { |cult| cult.name==name}
    end

    def self.find_by_location (location)
        @@all.select { |cult| cult.location==location}
    end

    def self.find_by_founding_year (year)
        @@all.select { |cult| cult.founding_year==year}
    end 

end