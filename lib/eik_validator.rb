require "eik_validator/version"

module EikValidator

  def self.validate(eik)
    Validator.new(eik).validate
  end

  class Validator

    def initialize(eik)
      @eik = eik.to_s
    end

    def numeric_check
      raise EikArgumentError unless ((Float(@eik) != nil) rescue false)
    end

    def length_check
      raise EikLengthError unless @eik.length == 9 or @eik.length == 13
    end

    def eik_multipliers(eik)
      if eik.length == 9
        [[1, 2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7, 8, 9, 10]]
      else
        [[2, 7, 3, 5], [4, 9, 5, 7]]
      end
    end

    def calculate_sum(eik, multipliers)
      sum = 0
      multipliers.each_with_index do |value, index|
        sum += eik[index].to_i * value
      end
      sum
    end

    def check_validity(eik)
      control_digit = eik.chars.last.to_i
      eik_multipliers(eik).each_with_index do |set, index|
        remainder = calculate_sum(eik, set) % 11
        return true if not remainder == 10 and remainder == control_digit
        return true if index == 1 and remainder == 10 and control_digit == 0
      end
      false
    end

    def validate
      numeric_check
      length_check

      if @eik.length == 9
        check_validity(@eik)
      else
        return check_validity(@eik[-5..-1]) if check_validity(@eik[0..8])
        false
      end
    end

  end

  class EikArgumentError < ArgumentError
  end

  class EikLengthError < StandardError
  end

end
