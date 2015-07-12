require './election_office'
#require './class_candidate'

class ElectionOffice
  attr_accessor :voter_list, :candidate_list

  def initialize
    @candidate_list = [
      Candidate.new("George Bush", "Rep"),
      Candidate.new("John Kerry", "Dem")
    ]
    @voter_list = [
      Voter.new("Juvenal", "Libertarian"),
      Voter.new("Joann", "Libertarian"),
      Voter.new("Stevie", "Conservative"),
      Voter.new("Chris", "Conservative"),
      Voter.new("Juan", "Independent"),
      Voter.new("Jeff", "Independent"),
      Voter.new("Robert", "Progressive"),
      Voter.new("Jose", "Progressive"),
      Voter.new("Pat", "Mass Dem"),
      Voter.new("Damon", "Mass Dem")
    ]
  end

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


new_election = ElectionOffice.new
new_election.show_options



       #   Have election break down main menu has certain actions on
       # people, create and store in array
       # (not out in open) in instance of election
       # list of voters, list of candidates for specific instance of
       # election. When create new person add to list of people
       # class Election
       # creates voters, creates polits, updates,
       # sends to another class
       # to tally voters
