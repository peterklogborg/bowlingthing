class Die
  def initialize
    @sides = 6
  end

  def roll
    # Simulates rolling a physical die by returning a random number between 1 and 6
    rand(1..@sides)
  end

  def sides
    @sides
  end
end 