require "./voter.rb"
require "./politician.rb"

#object enviorment where objects interact to create election
class WorldUI
  attr_accessor :politicians, :voters

# tallys the politcian and voter pop for use
  def initialize
    @politicians = []
    @voters = []
  end

# main menu for app operation
  def main_menu
    puts "What would you like to do? 
    (C)reate, (L)ist, (U)pdate, or (V)ote"
    option = gets.chomp.upcase
    case option
      when "C"
      create_menu
      when "L"
      create_list
      when "U"
      update()
      when "V"
      run_election()
      else
      main_menu()
    end
  end

# create menu that branches to pol. or voter
  def create_menu
    puts "What would you like to create? 
    (P)olitician or (V)oter"
    create_option = gets.chomp.upcase
    case create_option
      when "V"
      create_voter_menu
      when "P"
      create_politician_menu
      else
      create_menu
    end
    main_menu
  end

# create voter details
  def create_voter_menu
    puts "Name?"
    name = gets.chomp.downcase.capitalize
   
    puts "Politics? 
    (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    politics = gets.chomp.upcase
   
    @voters << Voter.new(name, politics)
    main_menu()
  end

#create politician details
  def create_politician_menu
    puts "Name?"
    name = gets.chomp.downcase.capitalize

    puts "Party? (D)emocrat or (R)epublican?"
    party = gets.chomp.upcase

    @politicians << Politician.new(name, party)
    main_menu()
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

#UPDATE
  def update
    puts "Who would you like to update?"
    name = gets.chomp.downcase.capitalize
      if name == find_voter(name).name

        puts "New name?"
        new_name = gets.chomp.downcase.capitalize
        find_voter(name).name = new_name

        puts "New Politics?"
        new_politics = gets.chomp.upcase
        find_voter(new_name).politics = new_politics
        puts "Done!"

      elsif ( name == find_politician(name).name)
        puts "New name?"
        new_name = gets.chomp.downcase.capitalize
        find_politician(name).name = new_name

        puts "New Party?"
        new_party = gets.chomp
        find_politician(new_name).politics = new_party
        puts "Done!"
      else
        puts "That's not anyone!"
        update()
      end
    main_menu()
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

    puts "The results are... #{score_board}"
    puts "Winner! #{winner(score_board)} \n "
    print "*" * 50
    print "\n"

  end

end

WorldUI.new.main_menu