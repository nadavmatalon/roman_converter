describe RomanConverter do

  let(:roman_numerals) { generate_roman_numerals(10000) }

  context 'arguments' do

    it 'can take a String as an argument' do
      expect(RomanConverter.convert('I')).to eq 1
    end

    it 'can take a Fixnum as an argument' do
      expect(RomanConverter.convert(1)).to eq 'I'
    end

    it 'raises a typeError if argument isn\'t String or Fixnum' do
      msg = 'Argument must be a String or Fixnum'
      [:I, ['I'], {'I' => 1}].each do |argument|
        expect{ RomanConverter.convert(argument) }.to raise_error(TypeError, msg)
      end
    end
  end

  context 'conversions' do

    it 'can convert any roman numeral between \'I-MMMMMMMMMM\' to a natural number' do
      roman_numerals.each_with_index do |numeral, index|
        expect(RomanConverter.convert_roman(numeral)).to eq index + 1
      end
    end

    it 'can convert any natural number between 1-10000 to a roman_numeral' do
      (1..10000).to_a.each_with_index do |number, index|
        expect(RomanConverter.convert_natural(number)).to eq roman_numerals[index]
      end
    end
  end
end
