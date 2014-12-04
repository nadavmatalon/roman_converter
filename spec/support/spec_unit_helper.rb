def generate_roman_numerals(arr_length)
  Array.new(arr_length) do |index|
    numeral = index + 1
    RomanConverter::ROMAN_NUMERALS_TABLE.invert.keys.inject('') do |roman, div|
      times, numeral = numeral.divmod(div)
      roman << RomanConverter::ROMAN_NUMERALS_TABLE.invert[div] * times
    end
  end
end
