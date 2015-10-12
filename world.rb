require "./voter.rb"
require "./politician.rb"
class World

  def initialize
    @politicians = []
    @voters = []
  end

#LIST
 def create_list
  print "*" * 50
  print "\nPoliticians: | "
  @politicians.each do |politician|
    print "#{politician.name}, #{politician.politics} | "
    end
  print "\n\nVoters: | "
  @voters.each do |voter|
    print "#{voter.name}, #{voter.politics} | "
    end
  puts "\n"
  print "*" * 50, "\n"
  main_menu
 end

  def find_voter(name)
    voter_object = ""
    @voters.each do |voter|
      if voter.name == name 
        voter_object = voter 
      end
    end
    voter_object
  end

  def find_politician(name)
    politician_object = ""
    @politicians.each do |politician|
      if politician.name == name 
        politician_object = politician
      end
    end
    politician_object
  end

  # winner!
  def winner(election)
    election.max_by{|k,v| v}
  end

  # What vote option executes to run election
  def run_election
    population = @politicians + @voters

    score_board = {}

    @politicians.each do |politician|
      score_board[politician.name] = 0
    end

    population.each do |person|
      politician = person.vote(@politicians)
      score_board[politician.name] += 1
    end


  puts '''
        ()__
        ||**Z__
        ||**|**=Z____
        ||**|**=|====|
        ||==|**=|====|
        ||""|===|====|
        ||  `"""|====|
        ||      `""""`
    '''
    puts "The results are... #{score_board}"
    puts "Winner! #{winner(score_board)} \n "
    print "*" * 50
    print "\n"

  end


end