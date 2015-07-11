require './class_voter'

def test_voter
  name = "Sandy"
  politics = "Progressive"
  v = Voter.new(name, politics)
  raise "Wrong name" unless v.name == name
  raise "Wrong politics" unless v.politics == politics
  v
end

voter = test_voter


require './class_candidate'

def test_candidate(voter)
  name = "Mike"
  party = "Republican"
  c = Candidate.new(name, party)
  raise "Wrong name" unless c.name == name
  raise "Wrong party" unless c.party == party

  c.convinced?(voter)

end

def test_campagin
  campaign = Campaign.new(voters, candidates)
  winner = campaign.run
  puts winner.name, winner.part
end

test_candidate(voter)


voters = [
  Voter.new "Amy", "Progressive"),
  Voter.new "Burt", "Libertarian"),
  Voter.new "Charlie", "Independent"),
  Voter.new "Amy", "Conservative"),
  Voter.new "Amy", "Massechusetts Democrat"),
]
candidates = [
    Candidate.new("Sam", "Republican")
    Candidate.new("Rebecca", "Democrat")
    Candidate.new("Theo", "Republican")
    Candidate.new("Ulrich", "Republican")
    Candidate.new("Victor", "Republican")
    Candidate.new("Walter", "Republican")
]

voters += candidates

candidates.each do |c|
  c.votes = c.stump(voters)
end

winner = # The candidate with the most votes
