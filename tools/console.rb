require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
#Cult.new(name, location, founding_year, slogan, minimum_age)
#Follower.new(name, age, life_motto)
#Blood_Oath.new(cult, follower, initiation_date = Time.now)

cubs = Cult.new("Cubs", "Chicago", 1890, "Go Cubs Go", 16)
white_sox = Cult.new("White Sox", "Chicago", 1960, "F the Cubs", 20)
bulls = Cult.new("Bulls", "Chicago", 1972, "Da Bulls", 30)
bears = Cult.new("Bears", "Chicago", 1980, "Da Bears", 30)
cards = Cult.new("Cardinals", "St. Louis", 1940, "We Love Cards", 60)
rams = Cult.new("Cardinals", "Los Angeles", 1976, "Los Angeles yea", 50)

joe = Follower.new("Joe", 40, "I won't die until Cubs win WS")
moe = Follower.new("Moe", 43, "I won't die until White Sox win WS")
zoe = Follower.new("Zoe", 90, "I won't die until Bulls win Champ")
flo = Follower.new("Flo", 20, "I won't die until Bears win Champ")
fifo = Follower.new("Fifo", 30, "I won't die until Bears win Champ")
dito = Follower.new("Dito", 60, "I won't die until Bears win Champ")
#try guy below for recruit_follower in cult
guy = Follower.new("Guy", 35, "I won't die until Cubs win WS")
guy2 = Follower.new("Ehhhdy", 40, "I won't die until Bears win Champ")
guy3 = Follower.new("Ehhhdyz", 50, "I won't die until Bears win Champ")
guy4 = Follower.new("Ehhhdyzz", 60, "I won't die until Bears win Champ")
guy5 = Follower.new("Ehhhdyzzz", 70, "I won't die until Bears win Champ")
guy6 = Follower.new("Ehhhdyzzzz", 80, "I won't die until Bears win Champ")
guy7 = Follower.new("Ehhhdyzzzzz", 90, "I won't die until Bears win Champ")


oath1 = Blood_Oath.new(cubs, joe)
oath2 = Blood_Oath.new(bears, joe)
oath3 = Blood_Oath.new(bulls, joe)
oath4 = Blood_Oath.new(white_sox, moe)
oath5 = Blood_Oath.new(bulls, zoe)
oath6 = Blood_Oath.new(bears, zoe)
oath7 = Blood_Oath.new(cubs, fifo)
oath8 = Blood_Oath.new(cubs, dito)
oath9 = Blood_Oath.new(bulls, moe)
oath10 = Blood_Oath.new(bulls, guy)
oath11 = Blood_Oath.new(bulls, guy2)
oath12 = Blood_Oath.new(bulls, fifo)
oath11 = Blood_Oath.new(bulls, guy3)
oath11 = Blood_Oath.new(bulls, guy4)
oath11 = Blood_Oath.new(bulls, guy5)
oath11 = Blood_Oath.new(bulls, guy6)
oath11 = Blood_Oath.new(bulls, guy7)





binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
