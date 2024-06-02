
class Bowling
    attr_reader :score
       
    def hit(pin_count)
        @score ||= 0
        @score += pin_count
        @score
    end
end