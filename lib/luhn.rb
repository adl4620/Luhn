module Luhn
  def self.is_valid?(number)
    card_number = number.to_s.scan(/\d/).reverse.map(&:to_i).map.with_index do |value, index|
      if index.odd?
        double = value * 2
        if double >= 10
          double - 9
        else
          double
        end
      else
        value
      end
    end
    sum = 0
    return false unless (card_number.each { |n| sum += n }.reduce(:+) % 10).zero?
    true
  end
end
