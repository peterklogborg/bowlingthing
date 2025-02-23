require "test_helper"

class UnchartedWorldsTest < ActiveSupport::TestCase
  def test_roll_returns_number_within_valid_range
    100.times do
      result = UnchartedWorlds.roll
      assert result.between?(2, 12), "Roll #{result} should be between 2 and 12"
    end
  end

  def test_roll_with_modifier
    modifier = 3
    100.times do
      result = UnchartedWorlds.roll(modifier)
      assert result.between?(5, 15), "Roll with modifier #{result} should be between 5 and 15"
    end
  end

  def test_roll_with_outcome_success
    UnchartedWorlds.stubs(:roll).returns(10)
    result = UnchartedWorlds.roll_with_outcome
    assert_equal('success', result)
  end

  def test_roll_with_outcome_success_with_consequence
    UnchartedWorlds.stubs(:roll).returns(8)
    result = UnchartedWorlds.roll_with_outcome
    assert_equal('success with consequence', result)
  end

  def test_roll_with_outcome_failure
    UnchartedWorlds.stubs(:roll).returns(6)
    result = UnchartedWorlds.roll_with_outcome
    assert_equal('failure', result)
  end

  def test_roll_with_outcome_includes_modifier
    UnchartedWorlds.stubs(:roll).with(3).returns(10)
    result = UnchartedWorlds.roll_with_outcome(3)
    assert_equal('success', result)
  end

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
        result = UnchartedWorlds.roll_with_outcome(modifier)
        results[result] += 1
      end

      puts "\n    # Results with modifier #{modifier} (#{rolls_per_modifier} rolls):"
      results.each do |outcome, count|
        percentage = (count.to_f / rolls_per_modifier * 100).round(1)
        puts "    # #{outcome}: #{count} (#{percentage}%)"
      end
    end

    assert true, "Distribution test completed"

    # Results with modifier -4 (1000 rolls):
    # success: 0 (0.0%)
    # success with consequence: 80 (8.0%)
    # failure: 920 (92.0%)

    # Results with modifier -3 (1000 rolls):
    # success: 0 (0.0%)
    # success with consequence: 164 (16.4%)
    # failure: 836 (83.6%)

    # Results with modifier -2 (1000 rolls):
    # success: 21 (2.1%)
    # success with consequence: 248 (24.8%)
    # failure: 731 (73.1%)

    # Results with modifier -1 (1000 rolls):
    # success: 82 (8.2%)
    # success with consequence: 351 (35.1%)
    # failure: 567 (56.7%)

    # Results with modifier 0 (1000 rolls):
    # success: 160 (16.0%)
    # success with consequence: 450 (45.0%)
    # failure: 390 (39.0%)

    # Results with modifier 1 (1000 rolls):
    # success: 304 (30.4%)
    # success with consequence: 439 (43.9%)
    # failure: 257 (25.7%)

    # Results with modifier 2 (1000 rolls):
    # success: 423 (42.3%)
    # success with consequence: 410 (41.0%)
    # failure: 167 (16.7%)

    # Results with modifier 3 (1000 rolls):
    # success: 594 (59.4%)
    # success with consequence: 333 (33.3%)
    # failure: 73 (7.3%)

    # Results with modifier 4 (1000 rolls):
    # success: 737 (73.7%)
    # success with consequence: 230 (23.0%)
    # failure: 33 (3.3%)
  end
end 