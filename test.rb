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



end

#
ElectionOffice.new



       #   Have election break down main menu has certain actions on
       # people, create and store in array
       # (not out in open) in instance of election
       # list of voters, list of candidates for specific instance of
       # election. When create new person add to list of people
       # class Election
       # creates voters, creates polits, updates,
       # sends to another class
       # to tally voters
