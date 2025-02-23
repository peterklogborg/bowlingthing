class UnchartedWorlds
  def self.roll(modifier = 0)
    # Create dice for this roll
    die1 = Die.new
    die2 = Die.new
    
    # Roll two dice and add the modifier
    result = die1.roll + die2.roll + modifier
    
    # Return the total
    result
  end

  def self.roll_with_outcome(modifier = 0)
    total = roll(modifier)
    
    case 
    when total >= 10
      'success'
    when total >= 7 && total <= 9
      'success with consequence'
    else # 6 or below
      'failure'
    end
  end
end 