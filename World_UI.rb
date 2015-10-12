require "./voter.rb"
require "./politician.rb"
require "./world.rb"

#object enviorment where objects interact to create election
class WorldUI < World

  attr_accessor :politicians, :voters

# tallys the politcian and voter pop for use

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

#UPDATE mechanism. Update Anyone!
  def update
    puts "Who would you like to update?"
    name = gets.chomp.downcase.capitalize

      if find_voter(name) == "" && find_politician(name) == ""
        puts "That's not anyone!"
        update()

      elsif ( find_politician(name) == "" && name == find_voter(name).name)

        puts "Enter New Name:"
        new_name = gets.chomp.downcase.capitalize
        find_voter(name).name = new_name

        puts "Enter New Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
        new_politics = gets.chomp.upcase
        find_voter(new_name).politics = new_politics
        puts "Done!"

      else 
        puts "Enter New Name:"
        new_name = gets.chomp.downcase.capitalize
        find_politician(name).name = new_name

        puts "New Party?: (D)emocrat or (R)epublican"
        new_party = gets.chomp.upcase
        find_politician(new_name).politics = new_party
        puts "Done!"
      end
    main_menu()
 end


end

WorldUI.new.main_menu