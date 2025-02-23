class UnchartedWorldsWithAdvantage < UnchartedWorlds
  def self.roll(advantage = 0)
    # Always roll 2 + abs(advantage) dice
    dice = (2 + advantage.abs).times.map { Die.new }
    
    # Roll all dice
    rolls = dice.map(&:roll)
    
    # Take highest 2 dice for positive advantage, lowest 2 for negative
    if advantage >= 0
      rolls.sort.last(2).sum
    else
      rolls.sort.first(2).sum
    end
  end
end 