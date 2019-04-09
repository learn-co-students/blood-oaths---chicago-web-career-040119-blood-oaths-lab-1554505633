require "pry"
#Cult.new(name, location, founding_year, slogan, minimum_age)
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
    if self.age >= cult_choice.minimum_age
      Blood_Oath.new(cult_choice, self)
    else
      "Sorry, #{self.name}, you must be at least #{cult_choice.minimum_age} years young to become a follower of the #{cult_choice.name}."
    end
  end

  def my_cults_slogans
    self.cults.map { |cult|
      cult.slogan
    }
  end

  def fellow_cult_members
    cult_members = self.cults.map { |cult|
      cult.followers
    }
    #code below flattens the array of arrays of members the follower instane is a member of
    #we get rid of duplicates with uniq and then remove the follower looking for fellow members with self
    members_uniq = cult_members.flatten.uniq.delete(self)
    binding.pry
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

  def self.most_active
    oaths_by_follow = Blood_Oath.all.group_by { |oath|
      oath.follower
    }
    count_hash = oaths_by_follow.transform_values { |oaths_arr|
      oaths_arr.size
    }
    count_hash.max_by{| k,v | v}[0]
  end

  def self.top_ten
    oaths_by_follow = Blood_Oath.all.group_by { |oath|
      oath.follower
    }
    count_hash = oaths_by_follow.transform_values { |oaths_arr|
      oaths_arr.size
    }
    #sort arr returns an array of 2 unit arrays. The sub-arrays are like this [follower, count_of_oaths]
    sort_arr = count_hash.sort_by { |k,v| v}.reverse
    #final_arr is a map of sort_arr that only has the follower instances. We removed the count from the sort_arr
    final_arr = sort_arr.map(&:first)
    binding.pry
  end

end
