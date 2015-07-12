class Candidate
  # @@next_candidate_id is initially 1, but increments +1
  # with each new candidate made
  @@next_candidate_id = 1
  # All are stored in a class "factory" list for easy
  # storage and selection
  @@candidate_list = {}
  attr_accessor :name, :party, :id, :next_candidate_id, :candidate_list

  def initialize(name, party)
    @name = name
    @party = party
    # @id is calling card for easily selecting candidate
    @id = @@next_candidate_id
    # @@next_candidate_id increments by +1
    @@next_candidate_id += 1
    # Each instance is stored into the "factory"
    # hash (@@candidate_list) with the key [@id]
    @@candidate_list[@id] = self
  end

  # Gets the @@candidate_list hash
  def self.candidate_list
    @@candidate_list
  end

  # Converts candidate instance @id number and @name
  # into a user friendly string
  def name_to_s
    "Candidate Name:  #{@name}"
  end

  def party_to_s
    "Candidate Party: #{@party}"
  end

  # Converts candidate "factory" hash into a user friendly
  # list of candidate id's and names
  def self.show_names
    @@candidate_list.each do |key, value|
      puts "#{key} :#{value.name_to_s}"
    end
  end

  # Converts candidate "factory" hash into a user friendly
  # list of candidate id's and names
  def self.show_party_affiliation
    @@candidate_list.each do |key, value|
      puts "#{key}: #{value.party_to_s}"
    end
  end

  def self.show_all_info
    @@candidate_list.each do |key, value|
      puts <<-END
      #{key}: #{value.name_to_s}
         #{value.party_to_s}

      END
    end
  end

  # def change_next_id(next_id)
  #   @@next_candidate_id = next_id
  # end

  def self.preview_next_id
    @@next_candidate_id
  end

  # def stump(candidate)
  #   candidate.each do |v|
  #     v.listen(party)
  #   end
  # end

end
#
# Candidate.new("George Bush", "Rep")
# Candidate.new("John Kerry", "Dem")
#
# Candidate.show_candidate_info
