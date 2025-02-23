require "test_helper"

class UnchartedWorldsWithAdvantageTest < ActiveSupport::TestCase
  def test_outcome_distribution_with_different_modifiers
    modifiers = [-4, -3, -2, -1, 0, 1, 2, 3, 4]
    rolls_per_modifier = 1000

    modifiers.each do |modifier|
      results = {
        'success' => 0,
        'success with consequence' => 0,
        'failure' => 0
      }

      rolls_per_modifier.times do
        result = UnchartedWorldsWithAdvantage.roll_with_outcome(modifier)
        results[result] += 1
      end

      puts "\n    # Results WITH ADVANTAGE, modifier #{modifier} (#{rolls_per_modifier} rolls):"
      results.each do |outcome, count|
        percentage = (count.to_f / rolls_per_modifier * 100).round(1)
        puts "    # #{outcome}: #{count} (#{percentage}%)"
      end
    end

    assert true, "Distribution test with advantage completed"

    # Results WITH ADVANTAGE, modifier -4 (1000 rolls):
    # success: 2 (0.2%)
    # success with consequence: 43 (4.3%)
    # failure: 955 (95.5%)

    # Results WITH ADVANTAGE, modifier -3 (1000 rolls):
    # success: 4 (0.4%)
    # success with consequence: 96 (9.6%)
    # failure: 900 (90.0%)

    # Results WITH ADVANTAGE, modifier -2 (1000 rolls):
    # success: 16 (1.6%)
    # success with consequence: 162 (16.2%)
    # failure: 822 (82.2%)

    # Results WITH ADVANTAGE, modifier -1 (1000 rolls):
    # success: 47 (4.7%)
    # success with consequence: 272 (27.2%)
    # failure: 681 (68.1%)

    # Results WITH ADVANTAGE, modifier 0 (1000 rolls):
    # success: 174 (17.4%)
    # success with consequence: 415 (41.5%)
    # failure: 411 (41.1%)

    # Results WITH ADVANTAGE, modifier 1 (1000 rolls):
    # success: 374 (37.4%)
    # success with consequence: 417 (41.7%)
    # failure: 209 (20.9%)

    # Results WITH ADVANTAGE, modifier 2 (1000 rolls):
    # success: 520 (52.0%)
    # success with consequence: 372 (37.2%)
    # failure: 108 (10.8%)

    # Results WITH ADVANTAGE, modifier 3 (1000 rolls):
    # success: 660 (66.0%)
    # success with consequence: 289 (28.9%)
    # failure: 51 (5.1%)

    # Results WITH ADVANTAGE, modifier 4 (1000 rolls):
    # success: 742 (74.2%)
    # success with consequence: 245 (24.5%)
    # failure: 13 (1.3%)
  end
end 