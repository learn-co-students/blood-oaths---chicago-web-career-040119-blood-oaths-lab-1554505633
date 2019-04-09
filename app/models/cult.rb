require "pry"
#Follower.new(name, age, life_motto)
#Blood_Oath.new(cult, follower, initiation_date = Time.now)
class Cult
  ## Instance variables /////////////
  attr_accessor :name, :location, :founding_year, :slogan
  ## Class variables ////////////////
  @@all = []
  ## Instance methods ////////////////
  def initialize(name, location, founding_year, slogan)
    ## Instance ////////////////////////
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan

    ## Class ///////////////////////////
    @@all << self
  end

  def recruit_follower(follow)
    Blood_Oath.new(self, follow)
  end

  def cult_population
    #below returns array that contains oaths that match cults
    arr = Blood_Oath.all.select { |oath|
      oath.cult == self
    }
    arr.size
  end

  def average_age

  end
  ## Class methods ///////////////////

  def self.all
    @@all
  end

  def self.find_by_name(name_query)
    @@all.find{ |cult|
      cult.name == name_query
    }
  end

  def self.find_by_location(loc_query)
    @@all.select{ |cult|
      cult.location == loc_query
    }
  end

  def self.find_by_founding_year(year_query)
    @@all.select{ |cult|
      cult.founding_year == year_query
    }
  end

end
