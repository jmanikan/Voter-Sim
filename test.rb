require './main_menu_to_option_methods'
require './class_candidate'


# Display starting text
# Needs better UI friendliness
def main_menu_text
  puts "What would you like to do?"
  puts "-- Type '1' to add."
  puts "-- Type '2' to update."
  puts "-- Type '3' to display.."
  puts "-- Type '4' to delete."
  main_menu_options
end

# Get response
# Needs to be fleshed out
def main_menu_options
  choice = gets.chomp.downcase
  case choice
  when '1'
    # Choose type goes to make_voter, make_candidate
    choose_type
  when '2'
    # Goes to a choice method to update_voter, update_candidate
    update
  when '3'
    # Goes to a method to display all voters and candidates
    # or a choice of either/or.
    display
  when '4'
    # Goes to a method to choose to remove either a voter
    # or a candidate from the game.
    delete
  else
    puts "Sorry, I didn't understand you."
    # Needs to repeat
  end

# Called on by "when '1'" in main_menu_options
# Needs choices to be connected to respective maker methods
def choose_type
  puts "Would you like to create a Politician (1) or a Voter (2)?"
  choice = gets.chomp.downcase
  case choice
  when "1"
    puts "Politician"
    # Needs to link to Politician maker
  when "2"
    puts "Voter"
    # Needs to link to Voter maker
  else
    puts "Didn't understand."
    # Needs to repeat
  end
end

def make_politician

end

def make_voter

end



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
