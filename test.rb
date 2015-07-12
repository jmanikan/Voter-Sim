require './menu'

Candidate.new("George Bush", "Rep")
Candidate.new("John Kerry", "Dem")
Voter.new("Juvenal", "Libertarian")
Voter.new("Joann", "Libertarian")
Voter.new("Stevie", "Conservative")
Voter.new("Chris", "Conservative")
Voter.new("Juan", "Independent")
Voter.new("Jeff", "Independent")
Voter.new("Robert", "Progressive")
Voter.new("Jose", "Progressive")
Voter.new("Pat", "Mass Dem")
Voter.new("Damon", "Mass Dem")


def update_what_type
  puts <<-END
  Who would you like to update?
  (1) Candidate
  (2) Voter
  END
  case gets.chomp
  when "1"
    update_candidate_outer
  when "2"
    update_voter_outer
  else
    puts "Sorry, that was an invalid entry."
    update_what_type
  end
end

# p Voter.voter_list[1]


update_what_type
