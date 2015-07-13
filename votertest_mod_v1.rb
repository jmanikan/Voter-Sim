# require './class_candidate'
# require './class_voter'


class ElectionTime
  attr_accessor :voter_list, :candidate_list

  def initialize(voter_list, candidate_list)
    @voter_list = voter_list
    @candidate_list = candidate_list
  end

  def campaign # Called on each new instance of VoterSimulation class

    democratic = 1 # Votes for democratic candidates go here
    republican = 1 # Votes for republican candidates go here

    def tabulation(democratic, republican)
      vote_count = democratic + republican
      puts ""
        puts <<-END
        All in all, #{vote_count} voters cast their ballots including
        the candidates, who as we believe, in these times,
        voted for themselves.

        END
      if democratic > republican
        puts <<-END
        It is a resurgent Democratic Party we are seeing today.
        The Democratic Candidate wins with a margin of #{democratic} votes!
        'The Republican Revolution' is over!

        END
      else
        puts <<-END
        The Republican Candidate carries the day,
        getting #{republican} votes and wins the election!.
        'DEMS IN THE DUMPS!' will be tomorrow's headline.

        END
      end
    end
    sleep(5)
    msg = "CAMPAIGN SEASON IN FULL SWING... CAMPAIGN SEASON IN FULL SWING..."
    10.times do
      print "\r#{ msg }"
      sleep 0.5
      print "\r#{ ' ' * msg.size }" # Flashes msg
      sleep 0.5
      puts ""
    end

    @voter_list.each do |voter| # Iterates over voter_list and
      @candidate_list.each do |candidate| # candidate_list to run cases
        # Only Democratic candidates are used since thresholds not being crossed results in Republican votes
        case #conservative_voter
        when voter.politics == "Conservative" && candidate.party == "Democratic"
          if rand(0..100) >= 75
            democratic += 1
            sleep(2)
            puts "#{voter.name} decides to vote Democratic."
          else
            sleep(2)
            republican += 1
            puts "#{voter.name} is and will always be a lifelong Republican."
          end
        end
        case #independent_voter
        when voter.politics == "Independent" && candidate.party == "Democratic"
          if rand(0..100) >= 50
            democratic += 1
            sleep(2)
            puts "#{voter.name} decides to vote Democratic."
          else
            sleep(2)
            republican += 1
            puts "#{voter.name} gives the Republicans a chance."
          end
        end
        case #libertarian_voter
        when voter.politics == "Libertarian" && candidate.party == "Democratic"
          if rand(0..100) >= 90
            democratic += 1
            sleep(2)
            puts "#{voter.name} decides to vote Democratic."
          else
            sleep(2)
            republican += 1
            puts "#{voter.name} never gave thought to voting for other than a Republican."
          end
        end
        case #massachussetts_democrat_voter
        when voter.politics == "Massachussetts Democrat" && candidate.party == "Democratic"
          if rand(0..100) >= 90
            republican += 1
            sleep(2)
            puts "#{voter.name} is a Blue Dog Democrat this election cycle."
          else
            sleep(2)
            democratic += 1
            puts "#{voter.name} knows Government is your friend and will be voting Democratic."
          end
        end
        case #progressive_voter
        when voter.politics == "Progressive" && candidate.party == "Democratic"
          if rand(0..100) >= 75
            republican += 1
            sleep(2)
            puts "#{voter.name} thinks #{candidate.name} ran an excellent campaign and deserves a vote."
          else
            sleep(2)
            democratic += 1
            puts "#{voter.name} believes #{candidate.name} campaigned well, but will not get a vote."
          end
        end
      end
    end
    sleep(5)
    msg = "ALL CERTIFIED RETURNS ARE IN... TABULATING THE OFFICIAL RESULTS..."
    10.times do
      print "\r#{ msg }"
      sleep 0.5
      print "\r#{ ' ' * msg.size }" # Flashes msg
      sleep 0.5
    end
    tabulation(democratic, republican)
  end
end



# Roll of voters
# voter_list = [
#   Voter.new("Juvenal", "Progressive"),
#   Voter.new("Angel", "Conservative"),
#   Voter.new("Paul", "Libertarian"),
#   Voter.new("Adam", "Massachussetts Democrat"),
#   Voter.new("Mashon", "Independent"),
#   Voter.new("Jeff", "Conservative"),
#   Voter.new("Patrick", "Progressive"),
#   Voter.new("Stevie", "Progressive"),
#   Voter.new("Juan", "Independent"),
#   Voter.new("Christopher", "Massachussetts Democrat"),
#   Voter.new("Ravi", "Libertarian"),
#   Voter.new("Joann", "Conservative"),
#   Voter.new("Manny", "Independent"),
#   Voter.new("Damon", "Progressive"),
#   Voter.new("Diego", "Progressive"),
#   Voter.new("Juha", "Libertarian"),
#   Voter.new("Stephen", "Massachussetts Democrat"),
#   Voter.new("Alaa", "Conservative"),
#   Voter.new("Jose", "Independent"),
#   Voter.new("Erin", "Conservative"),
#   Voter.new("Johanna", "Massachussetts Democrat"),
# ]

# Roll of candidates
# candidate_list = [
#   Candidate.new("Bush", "Republican"),
#   Candidate.new("Clinton", "Democratic")
# ]

# Runs the 'election' on every new VoterSimulation instance (ie., new campaign)
# votersim1 = ElectionTime.new(voter_list, candidate_list)
# p votersim1.voter_list == voter_list
# p votersim1.candidate_list == candidate_list
# votersim1.campaign
