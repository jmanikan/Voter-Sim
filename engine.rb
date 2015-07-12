require './class_candidate'
require './class_voter'

class VoterSimulation
  attr_accessor :voter_list, :candidate_list
  def initialize(voter_list, candidate_list)
    @voter_list = voter_list
    @candidate_list = candidate_list
  end

  # def campaign

  decision = []

    @voter_list.each { |voter|
      @candidate_list.each { |candidate|
        if
          voter.politics == "Progressive" && candidate.party == "Republican"
          voting_prob = rand(0..100) > 75
          p decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Progressive" && candidate.party == "Democratic"
          voting_prob = rand(0..100) - 75
          p decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Conservative" && candidate.party == "Republican"
          voting_prob = rand(0..100) - 75
          p decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Conservative" && candidate.party == "Democratic"
          voting_prob = rand(0..100) - 25
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Independent" && candidate.party == "Republican"
          voting_prob = rand(0..100) - 50
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Independent" && candidate.party == "Democratic"
          voting_prob = rand(0..100) - 50
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Libertarian" && candidate.party == "Republican"
          voting_prob = rand(0..100) - 90
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Libertarian" && candidate.party == "Democratic"
          voting_prob = rand(0..100) - 10
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Massachussetts Democratic" && candidate.party == "Republican"
          voting_prob = rand(0..100) - 10
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        elsif
          voter.politics == "Massachussetts Democratic" && candidate.party == "Democratic"
          voting_prob = rand(0..100) - 90
          decision.push(voter.voter_name, candidate.candidate_name, voting_prob)
        else
        end
      }
    }
end

voter_list = [
  Voter.new("Juvenal", "Progressive"),
  Voter.new("Dulcinea", "Conservative"),
  Voter.new("Nino", "Libertarian"),
  Voter.new("Cap", "Massachussetts Democrat"),
  Voter.new("Bom", "Independent")
]
candidate_list = [
  Candidate.new("Bush", "Republican"),
  Candidate.new("Clinton", "Democratic")
]

votersim1 = VoterSimulation.new(voter_list, candidate_list)
votersim1.campaign
