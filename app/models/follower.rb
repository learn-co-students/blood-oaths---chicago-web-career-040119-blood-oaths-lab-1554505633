require "pry"
#Cult.new(name, location, founding_year, slogan)
#Blood_Oath.new(cult, follower, initiation_date = Time.now)
class Follower
  ## Instance variables /////////////
  attr_accessor :name, :age, :life_motto
  ## Class variables ////////////////
  @@all = []
  ## Instance methods ////////////////
  def initialize(name, age, life_motto)
    ## Instance ////////////////////////
    @name = name
    @age = age
    @life_motto = life_motto

    ## Class ///////////////////////////
    @@all << self
  end

  def cults
    #below will return an array with all the cults the follower is member to
    oath_arr = Blood_Oath.all.select { |oath|
      oath.follower == self
    }

    oath_arr.map { |oath|
      oath.cult
    }
  end

  def join_cult(cult_choice)
    Blood_Oath.new(cult_choice, self)
  end

  ## Class methods ///////////////////

  def self.all
    @@all
  end

  def self.of_a_certain_age(age_query)
    @@all.select { |follower|
      follower.age >= age_query
    }
  end

end
