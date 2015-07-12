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


# =>  This point and below needs work
#  display branch
# =>        display all
# =>          display candidates
# =>          display voters
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



# Display starting text
# Needs better UI friendliness
def main_menu_text
  puts <<-END
  FRIENDLY INTRO TEXT ABOUT THE SIM
  BRIEF DESCRIPTION ABOUT IT AND WHAT TO DO
  END
  main_menu_options
end

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
    puts "Going to choose_type from in choose_options"
    choose_type
  when '2' # Update person
    puts "Going to update_what_type from in choose_options"
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

###################
# Start of the 'add' branch

# Called on by "when '1'" in main_menu_options
# Needs choices to be connected to respective maker methods
def choose_type
  puts "Would you like to create a Candidate (1) or a Voter (2)?"
  choice = gets.chomp.downcase
  case choice
  when "1" # Candidate
    # Logging for easier problem shooting
    puts "Calling make_candidate"
    make_candidate
  when "2" # Voter
    # Logging for easier problem shooting
    puts "Calling make_voter"
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

##################
# Start of the 'update' branch

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
  Candidate.show_all_info
  puts "Who would you like to update?"
  choice = gets.chomp.to_i
  candidate_to_be_updated = Candidate.candidate_list[choice]
  if candidate_to_be_updated
    # Drops down to the method below
    update_candidate_inner(candidate_to_be_updated)
    # Back from the method below
  else
    puts "Sorry, your input was invalid."
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
    puts "The candidate's name has been changed to: #{candidate_to_be_updated.name}."
  when "2" # party
    puts "The current party is: #{candidate_to_be_updated.party}\nWhat would you like to update it to?"
    candidate_to_be_updated.party = gets.chomp
    puts "The candidate's party has been changed to: #{candidate_to_be_updated.party}."
  else
    puts "Sorry, your input was invalid."
    update_candidate_inner
  end
end


# Do the same for voters what you did for candidates
# Access specific voter
def update_voter_outer
  Voter.show_all_info
  puts "Who would you like to update?"
  choice = gets.chomp.to_i
  voter_to_be_updated = Voter.voter_list[choice]
  if voter_to_be_updated
    # Drops down to the method below
    update_voter_inner(voter_to_be_updated)
    # Back from the method below
  else
    puts "Sorry, your input was invalid."
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
    puts "The voter's name has been changed to: #{voter_to_be_updated.name}."
  when "2" # party
    puts "The current party is: #{voter_to_be_updated.party}\nWhat would you like to update it to?"
    voter_to_be_updated.party = gets.chomp
    puts "The voter's party has been changed to: #{voter_to_be_updated.party}."
  else
    puts "Sorry, your input was invalid."
    update_voter_inner
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

  # if movies[title.to_sym].nil?
  #   puts "Movie not found!"
  # else
  #   puts "What's the new rating? (Type a number 0 to 4.)"
  #   rating = gets.chomp
  #   movies[title.to_sym] = rating.to_i
  #   puts "#{title} has been updated with new rating of #{rating}."
  # end




# def update
#   puts "What movie do you want to update?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Movie not found!"
#   else
#     puts "What's the new rating? (Type a number 0 to 4.)"
#     rating = gets.chomp
#     movies[title.to_sym] = rating.to_i
#     puts "#{title} has been updated with new rating of #{rating}."
#   end
# end


#
# def display
#   movies.each do |movie, rating|
#     puts "#{movie}: #{rating}"
#   end
# end
#
# def delete
#   puts "What movie do you want to delete?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Movie not found!"
#   else
#     movies.delete(title.to_sym)
#     puts "#{title} has been removed."
#   end
# end
#
# #################################################
#
# puts "What would you like to do?"
# puts "-- Type 'add' to add a movie."
# puts "-- Type 'update' to update a movie."
# puts "-- Type 'display' to display all movies."
# puts "-- Type 'delete' to delete a movie."
#
# choice = gets.chomp.downcase
# case choice
# when 'add'
#   add
# when 'update'
#   update
# when 'display'
#   display
# when 'delete'
#   delete
# else
#   puts "Sorry, I didn't understand you."
# end
#
#


#

# def make_candi
#   puts "Enter the name, then the party"
#   Candidate.new( gets.chomp, gets.chomp )
# end
