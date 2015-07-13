require './class_candidate'
require './class_voter'
require './votertest_mod_v1'



#################################################
# What does it need?
#
#
#
# Bug in the delete section when trying to delete someone from an empty list
##################################################
# I've split the organization of this into the 4
# branches that you see above.


class ElectionOffice
  attr_accessor :voter_list, :candidate_list


  # Display starting text
  # Needs better UI friendliness
  def initialize
    @candidate_list = []
    @voter_list = []
    puts <<-END


    Welcome to the Election Simulator!

    It's election season in Florida


    END
    # main_menu_options
  end

  # Displays Main Menu Options
  def main_menu_options
    puts <<-END
    What would you like to do?
    Press the corresponding number
    and press enter to make a decision.

    (1) to add.
    (2) to update.
    (3) to display.
    (4) to delete.

    (5) to run the Election!

    Type (quit) to exit the game.

    END
    choose_options
  end

  # Get response
  # Needs to be fleshed out
  def choose_options
    choice = gets.chomp.downcase
    case choice
    when '1' # Add new person
      choose_type
    when '2' # Update person
      # Goes to a choice method to update_voter, update_candidate
      update_what_type
    when '3' # Display groups
      # Goes to a method to display all voters and candidates
      # or a choice of either/or.
      show_options
    when '4' # Delete person :'(
      # Goes to a method to choose to remove either a voter
      # or a candidate from the game.
      delete_from_which_list
    when '5' # Run Election!
      election = ElectionTime.new(@voter_list, @candidate_list)
      election.campaign
      puts "What an exciting race! Thank you for using the Election Simulator!"
    when 'quit' # Quit Game
      exit
    when 'hidden'
      load_example_groups
    else
      puts "Sorry, your input was invalid.\n'1' for add, '2' for update, '3' for display, '4' for delete.\nCalling main_menu_options"
      choose_options
    end
  end

  # For Presentation purposes
  def load_example_groups
    @voter_list = [
      Voter.new("Juvenal", "Progressive"),
      Voter.new("Angel", "Conservative"),
      Voter.new("Paul", "Libertarian"),
      Voter.new("Adam", "Massachussetts Democrat"),
      Voter.new("Mashon", "Independent"),
      Voter.new("Jeff", "Conservative"),
      Voter.new("Patrick", "Progressive"),
      Voter.new("Stevie", "Progressive"),
      Voter.new("Juan", "Independent"),
      Voter.new("Christopher", "Massachussetts Democrat"),
      Voter.new("Ravi", "Libertarian"),
      Voter.new("Joann", "Conservative"),
      Voter.new("Manny", "Independent"),
      Voter.new("Damon", "Progressive"),
      Voter.new("Diego", "Progressive"),
      Voter.new("Juha", "Libertarian"),
      Voter.new("Stephen", "Massachussetts Democrat"),
      Voter.new("Alaa", "Conservative"),
      Voter.new("Jose", "Independent"),
      Voter.new("Erin", "Conservative"),
      Voter.new("Johanna", "Massachussetts Democrat"),
    ]

    @candidate_list = [
      Candidate.new("Rick Scott", "Republican"),
      Candidate.new("Charlie Crist", "Democratic")
    ]

    main_menu_options
  end

  ################################
  ########   Add       ###########
  ################################

  # Called on by "when '1'" in main_menu_options
  # Needs choices to be connected to respective maker methods
  def choose_type
    puts <<-END
    Who do you want to create?
    (1) Candidate
    (2) Voter

    END
    choice = gets.chomp.downcase
    case choice
    when "1" # Candidate
      # Logging for easier problem shooting
      puts "In choose_type, calling make_candidate"
      make_candidate
    when "2" # Voter
      # Logging for easier problem shooting
      puts "In choose_type, calling make_voter"
      make_voter
    else
      puts "Sorry, that was an invalid entry."
      choose_type
    end
  end

  # User input into new instances of Candidate
  def make_candidate
    puts "What would you like to name this Candidate?"
    name = gets.chomp
    party = party_selection
    new_candidate = Candidate.new(name, party)
    puts "New candidate #{new_candidate.name} has joined the race as a #{new_candidate.party}!\n"
    @candidate_list << new_candidate
    make_another
  end

  # Used to standardize candidate parties
  def party_selection
    puts <<-END

    Would you like your politician to be a Republican or a Democrat?
    (1) Republican
    (2) Democrat

    END
    choice = gets.chomp
    case choice
    when "1"
      "Republican"
    when "2"
      "Democrat"
    else
      puts "Sorry, your input was invalid.\n"
      party_selection
    end
  end

  # User input into new instances of Voter
  def make_voter
    puts "What would you like to name this Voter?"
    name = gets.chomp
    politics = politics_selection
    new_voter = Voter.new(name, politics)
    puts "New voter #{new_voter.name} with #{new_voter.politics} views has signed up to vote!\n"
    @voter_list << new_voter
    make_another
  end

  # Used in make_voter to input standardized views
  def politics_selection
    puts <<-END

    What political views does this Voter subscribe to??
    (1) Libertarian
    (2) Conservative
    (3) Independent
    (4) Progressive
    (5) Massachussetts Democrat

    END
    choice = gets.chomp
    case choice
    when "1"
      "Libertarian"
    when "2"
      "Conservative"
    when "3"
      "Independent"
    when "4"
      "Progressive"
    when "5"
      "Massachussetts Democrat"
    else
      puts "Sorry, your input was invalid.\n"
      politics_selection
    end
  end

  # Ask to make another person or return to the menu
  def make_another
    puts <<-END
    Would you like to make another person?
    Press:
    (1) to make a Candidate,
    (2) for a Voter or
    (3) to return to the main menu.
    END
    case gets.chomp
    when "1" # Candidate
      make_candidate
    when "2" # Voter
      make_voter
    when "3" # Main menu
      main_menu_options
    else
      puts "I'm sorry, your input was not valid."
      make_another
    end
  end

  ################################
  ########   Update    ###########
  ################################

  def update_what_type
    puts <<-END
    Who would you like to update?
    (1) Candidate
    (2) Voter
    END
    case gets.chomp
    when "1" # Candidate
      update_candidate_outer
    when "2" # Voter
      update_voter_outer
    else
      puts "Sorry, that was an invalid entry."
      update_what_type
    end
  end

  # Access specific candidate
  def update_candidate_outer
    self.show_all_candidates    # Candidate.show_all_info
    puts <<-END
    Who would you like to update?
    Press the corresponding number in front of the candidate.
    END
    choice = (gets.chomp.to_i - 1)
    candidate_to_be_updated = @candidate_list[choice]
    if candidate_to_be_updated
      # Drops down to the method below
      update_candidate_inner(candidate_to_be_updated)
      # Back from the method below
    else
      puts "Sorry, your input was invalid.\n"
      update_candidate_outer
    end
    make_change_or_main_menu
  end
  # ^^^^^^^^^^^^ Tied Together vvvvvvvvvvvvv #
  def update_candidate_inner(candidate_to_be_updated)
    puts "Would you like to update this person's\n(1) name or (2) party?"
    case gets.chomp
    when "1" # name
      puts "The current name is: #{candidate_to_be_updated.name}\nWhat would you like to update it to?"
      candidate_to_be_updated.name = gets.chomp
      puts "The candidate's name has been changed to: #{candidate_to_be_updated.name}.\n"
    when "2" # party
      puts "The current party is: #{candidate_to_be_updated.party}\nWhat would you like to update it to?"
      candidate_to_be_updated.party = party_selection
      puts "The candidate's party has been changed to: #{candidate_to_be_updated.party}.\n"
    else
      puts "Sorry, your input was invalid.\n"
      update_candidate_inner(candidate_to_be_updated)
    end
  end


  # Do the same for voters what you did for candidates
  # Access specific voter
  def update_voter_outer
    self.show_all_voters
    puts <<-END
    Who would you like to update?
    Press the corresponding number in front of the voter.

    END
    choice = (gets.chomp.to_i - 1)
    voter_to_be_updated = @voter_list[choice]
    if voter_to_be_updated
      # Drops down to the method below
      update_voter_inner(voter_to_be_updated)
      # Back from the method below
    else
      puts "Sorry, your input was invalid.\n"
      update_voter_outer
    end
    make_change_or_main_menu
  end
  # ^^^^^^^^^^^^ Tied Together vvvvvvvvvvvvv #
  def update_voter_inner(voter_to_be_updated)
    puts "Would you like to update this person's\n(1) name or (2) party?"
    case gets.chomp
    when "1" # name
      puts "The current name is: #{voter_to_be_updated.name}\nWhat would you like to update it to?"
      voter_to_be_updated.name = gets.chomp
      puts "The voter's name has been changed to: #{voter_to_be_updated.name}.\n"
    when "2" # party
      puts "The current party is: #{voter_to_be_updated.party}\nWhat would you like to update it to?"
      voter_to_be_updated.party = politics_selection
      puts "The voter's party has been changed to: #{voter_to_be_updated.party}.\n"
    else
      puts "Sorry, your input was invalid."
      update_voter_inner(voter_to_be_updated)
    end
  end

  def make_change_or_main_menu
    puts <<-END
    What would you like to do?
    (1) Make another change
    (2) Go to the main menu

    END
    case gets.chomp
    when "1"
      update_what_type
    when "2"
      main_menu_options
    else
      puts "Sorry, your input was invalid."
    end
  end

  ################################
  ########   Display   ###########
  ################################

  def show_options
    puts <<-END
    Who would you like to see displayed?
    (1) Only Candidates
    (2) Only Voters
    (3) Both

    END
    choice = gets.chomp.to_i
    case choice
    when 1 # Candidates
      puts "All candidates running:"
      show_all_candidates
    when 2 # Voters
      puts "All voters weighing in:"
      show_all_voters
    when 3 # Both
      puts "Everyone involved:"
      show_everyone
    else
      puts "Sorry, your input was invalid.\n"
      show_options
    end
    main_menu_options
  end

  # Iterates over the @candidate_list and @voter_list to
  # display all the candidates,
  # with their names and party or politics
  def show_everyone
    puts "Candidates:"
    show_all_candidates
    puts "Voters:"
    show_all_voters
  end

  # Iterates over the @candidate_list to display all the candidates,
  # with their names and party affiliations
  def show_all_candidates
    i = 1
    @candidate_list.each do |key|
      puts <<-END
      #{i}  #{key.name_to_s}
            #{key.party_to_s}

      END
      i = i + 1
    end
  end

  # Iterates over the @voter_list to display all the voters,
  # with their names and political beliefs
  def show_all_voters
    i = 1
    @voter_list.each do |key|
      puts <<-END
      #{i}  #{key.name_to_s}
         #{key.politics_to_s}

      END
      i = i + 1
    end
  end

  ################################
  ########   Delete    ###########
  ################################

  def delete_from_which_list
    puts <<-END
    Which list would you like to delete from?
    (1) Candidates
    (2) Voters

    END
    choice = gets.chomp.to_i
    case choice
    when 1 # Candidates
      puts "I don't blame you."
      delete_candidate
    when 2 # Voters
      delete_voter
    else
      puts "Sorry, your input was invalid.\n"
      delete_from_which_list
    end
  end

  def delete_candidate
    show_all_candidates
    puts "Who would you like to delete?"
    choice = (gets.chomp.to_i - 1)
    if choice < 0
      puts "Sorry, your input was invalid.\n"
      delete_candidate
    elsif choice > @candidate_list.length
      puts "Sorry, your input was invalid.\n"
      delete_candidate
    else
      deleted_name = @candidate_list[choice].name
      @candidate_list.delete_at(choice)
      puts "#{deleted_name} has been deleted.\n"
    end
    delete_another_or_main_menu
  end


  def delete_voter
    show_all_voters
    puts "Who would you like to delete?"
    choice = (gets.chomp.to_i - 1)
    if choice < 0
      puts "Sorry, your input was invalid.\n"
      delete_voter
    elsif choice > @voter_list.length
      puts "Sorry, your input was invalid.\n"
      delete_voter
    else
      deleted_name = @voter_list[choice].name
      @voter_list.delete_at(choice)
      puts "#{deleted_name} has been deleted.\n"
    end
    delete_another_or_main_menu
  end


  def delete_another_or_main_menu
    puts <<-END
    Would you like to delete another or return to the main menu?
    (1) Delete another
    (2) Main menu

    END
    choice = gets.chomp
    case choice
    when "1"
      delete_from_which_list
    when "2"
      main_menu_options
    else
      puts "Sorry, your input was invalid."
      delete_another_or_main_menu
    end
  end


end
