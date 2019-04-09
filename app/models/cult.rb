require "pry"
#Follower.new(name, age, life_motto)
#Blood_Oath.new(cult, follower, initiation_date = Time.now)
class Cult
  ## Instance variables /////////////
  attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
  ## Class variables ////////////////
  @@all = []
  ## Instance methods ////////////////
  def initialize(name, location, founding_year, slogan, minimum_age)
    ## Instance ////////////////////////
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age

    ## Class ///////////////////////////
    @@all << self
  end

  def recruit_follower(follow)
    if follow.age >= self.minimum_age
      Blood_Oath.new(self, follow)
    else
      "Sorry, #{follow.name}, you must be at least #{self.minimum_age} years young to become a follower of the #{self.name}."
    end

  end

  def cult_population
    #below returns array that contains oaths that match cults
    arr = Blood_Oath.all.select { |oath|
      oath.cult == self
    }
    arr.size
  end

  def blood_oaths
    Blood_Oath.all.select { |oath|
      oath.cult == self
    }
  end

  def average_age
    #below is an array of all ages of followers of cult
    ages_arr = self.blood_oaths.map { |oath|
      oath.follower.age
    }

    age_av = ages_arr.sum.to_f / ages_arr.size.to_f
    age_av
  end

  def my_followers_mottos
    arr = self.blood_oaths.map {|oath|
            oath.follower.life_motto
          }
    arr.each {|motto|
      puts motto
    }
  end

  def followers
    arr = self.blood_oaths.map {|oath|
            oath.follower
          }
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

  def self.least_popular
    #below creates hash of oaths grouped by their cult
  test = Blood_Oath.all.group_by { |oath|
      oath.cult.name
    }

  test2 = test.transform_values { |oaths|
    oaths.size
  }
  min = 1000
  lame_cult = ""
  test2.each {|keyz, valz|
    if valz < min
      min = valz
      lame_cult = keyz
    end
  }
  Cult.find_by_name(lame_cult)
  end

  def self.most_common_location
    loc_arr =  @@all.map { |cult|
      cult.location
    }
    loc_hash = loc_arr.group_by { |city|
      city
    }
    new_hash = loc_hash.transform_values {|val|
      val.size
    }
    common_loc = new_hash.max_by{ |k,v| v}[0]
    common_loc
  end



end
