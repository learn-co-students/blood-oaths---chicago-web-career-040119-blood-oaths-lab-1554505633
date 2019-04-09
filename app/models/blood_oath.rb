require "pry"
#Cult.new(name, location, founding_year, slogan)
#Follower.new(name, age, life_motto)
class Blood_Oath
  ## Instance variables /////////////
  attr_accessor :cult, :follower, :initiation_date
  ## Class variables ////////////////
  @@all = []
  ## Instance methods ////////////////
  def initialize(cult, follower, initiation_date = Time.now)
    ## Instance ////////////////////////
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date

    ## Class ///////////////////////////
    @@all << self
  end
  ## Class methods ///////////////////

  def self.all
    @@all
  end

  def self.first_oath
  oath_date = @@all.map { |oath|
      follow = oath.follower
      date = oath.initiation_date
      {follow => date}
    }

    earliest_follower = oath_date.min_by { |k, v| v}

    earliest_follower.keys.first
  end

end
