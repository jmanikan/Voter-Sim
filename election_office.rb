require './class_candidate'
require './class_voter'



#################################################
# What does it need?
#  add branch
# =>        make candidate skeleton done
# =>        make voter skeleton done
#  update branch
# =>        update candidate skeleton done
# =>        update voter skeleton done
#  display branch
# =>        display all done
# =>          display candidates done
# =>          display voters done
# =>  This point and below needs work
#  delete branch
# =>        delete candidate
# =>        delete branch
#
#  Cleaning up and removing logging and placeholder TEXT
#  Just make it friendly
##################################################
# I've split the organization of this into the 4
# branches that you see above. I'm not sure how your
# engine is going to factor into it.


class ElectionOffice
  attr_accessor :voter_list, :candidate_list


  # Display starting text
  # Needs better UI friendliness
  def initialize
    puts <<-END
    FRIENDLY INTRO TEXT ABOUT THE SIM
    BRIEF DESCRIPTION ABOUT IT AND WHAT TO DO

    END
    main_menu_options
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
    END
    choose_options
  end

  # Get response
  # Needs to be fleshed out
  def choose_options
    choice = gets.chomp.downcase
    case choice
    when '1' # Add new person
      puts "In choose_options, going to choose_type."
      choose_type
    when '2' # Update person
      puts "In choose_options, going to update_what_type"
      # Goes to a choice method to update_voter, update_candidate
      update_what_type
    when '3' # Display groups
      # Goes to a method to display all voters and candidates
      # or a choice of either/or.
      display
    when '4' # Delete person :'(
      # Goes to a method to choose to remove either a voter
      # or a candidate from the game.
      delete
    else
      puts "Sorry, your input was invalid.\n'1' for add, '2' for update, '3' for display, '4' for delete.\nCalling main_menu_options"
      choose_options
    end
  end

  ################################
  ########   Add       ###########
  ################################

  # Called on by "when '1'" in main_menu_options
  # Needs choices to be connected to respective maker methods
  def choose_type
    puts "Would you like to create a Candidate (1) or a Voter (2)?"
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

  def make_candidate
    puts "What would you like to name this Candidate?"
    name = gets.chomp
    puts "What party does this Candidate belong to?"
    party = gets.chomp
    Candidate.new(name, party)
    make_another
  end

  def make_voter
    puts "What would you like to name this Voter?"
    name = gets.chomp
    puts "What political views does this Voter subscribe to?"
    politics = gets.chomp
    Voter.new(name, politics)
    make_another
  end

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
    puts "Who would you like to update?"
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
      candidate_to_be_updated.party = gets.chomp
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
    puts "Who would you like to update?"
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
      voter_to_be_updated.party = gets.chomp
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

  def show_everyone
    puts "Candidates:"
    show_all_candidates
    puts "Voters:"
    show_all_voters
  end

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


end
