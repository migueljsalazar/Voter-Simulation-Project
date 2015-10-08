

# voter class
class Voter
  attr_accessor :name, :politics

  # stores name and politics as instance params
  def initialize(name, politics)
    @name = name
    @politics = politics
  end

  # provides constant voter prob. values for election
  @@chance_of_republican = {
    "T" => 90,
    "C" => 75,
    "N" => 50,
    "L" => 25,
    "S" => 10
    }

  # voting method
  def vote(politicians)
    party = (rand(100) <= @@chance_of_republican[@politics]) ? "R" : "D"
    candidates = politicians.select do |politician|
      politician.politics == party
    end 

    candidates.sample
    # return single politician
  end
end