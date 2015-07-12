class Voter
  # @@next_voter_id is initially 1, but increments +1
  # with each new Voter made
  @@next_voter_id = 1
  # All are stored in a class "factory" list for easy
  # storage and selection
  @@voter_list = {}
  attr_accessor :name, :politics, :id, :next_voter_id, :voter_list

  # Set up so it will initialize, with the user's choice
  # of name and politics
  # Needs: Strict choices for politics
  def initialize(name, politics)
    @name = name
    @politics = politics
    # @id is calling card for easily selecting voters
    @id = @@next_voter_id
    # @@next_voter_id increments by +1
    @@next_voter_id += 1
    # Each instance is stored into the "factory"
    # hash (@@voter_list) with the key [@id]
    @@voter_list[@id] = self
  end

  # Gets the @@voter_list hash
  def self.voter_list
    @@voter_list
  end

  # Converts Voter instance @id number, @name and @politics
  # into a user friendly string
  def name_to_s
    "Voter Name:     #{@name}"
  end

  def politics_to_s
    "Voter Politics: #{@politics}"
  end

  # Converts Voter "factory" hash into a user friendly
  # list of Voter id's and names
  def self.show_names
    @@voter_list.each do |key, value|
      puts "#{key} :#{value.name_to_s}"
    end
  end

  # Converts Voter "factory" hash into a user friendly
  # list of Voter id's and names
  def self.show_politic_views
    @@voter_list.each do |key, value|
      puts "#{key}: #{value.name_to_s}"
    end
  end

  def self.show_all_info
    @@voter_list.each do |key, value|
      puts <<-END
      #{key}: #{value.name_to_s}
         #{value.politics_to_s}

      END
    end
  end

  # def change_next_id(next_id)
  #   @@next_voter_id = next_id
  # end

  def self.preview_next_id
    @@next_voter_id
  end

  # Keeping in case it's useful later
  # def preview_next_id
  #   @@next_voter_id
  # end

end


#
# Voter.new("Juvenal", "Libertarian")
# Voter.new("Joann", "Libertarian")
# Voter.new("Stevie", "Conservative")
# Voter.new("Chris", "Conservative")
# Voter.new("Juan", "Independent")
# Voter.new("Jeff", "Independent")
# Voter.new("Robert", "Progressive")
# Voter.new("Jose", "Progressive")
# Voter.new("Pat", "Mass Dem")
# Voter.new("Damon", "Mass Dem")
#
# Voter.show_voter_info
