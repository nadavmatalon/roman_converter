class RomanConverter

  ROMAN_NUMERALS_TABLE =
    {
      'M'  => 1000,
      'CM' => 900,
      'D'  => 500,
      'CD' => 400,
      'C'  => 100,
      'XC' => 90,
      'L'  => 50,
      'XL' => 40,
      'X'  => 10,
      'IX' => 9,
      'V'  => 5,
      'IV' => 4,
      'I'  => 1
    }

  def self.convert(input)
    case input
      when String then convert_roman(input)
      when Fixnum then convert_natural(input)
      else fail TypeError, 'Argument must be a String or Fixnum'
    end
  end

  def self.convert_roman(roman_str)
    number = 0
    ROMAN_NUMERALS_TABLE.each do |numeral, natural|
      while roman_str.index(numeral) == 0
        number += natural
        roman_str.slice!(numeral)
      end
    end
    number
  end

  def self.convert_natural(number)
    roman_str = ''
    ROMAN_NUMERALS_TABLE.each do |roman, natural|
      while (number >= natural)
        roman_str << roman
        number -= natural
      end
    end
    roman_str
  end
end
