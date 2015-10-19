require "./voter.rb"

# politician class
class Politician < Voter

# during voting method politicians vote for themselves
  def vote (politicians)
    self
  end

end
