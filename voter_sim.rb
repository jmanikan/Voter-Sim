class Person
  attr_accessor :name
end

class Candidate < Person
  attr_accessor :name

  def initialize(name, party)
    @name = name
    @party = party
  end
end

class Voter < Person
  attr_accessor :politics

  def initialize(name, politics)
    @name = name
    @politics = politics
  end
end
