describe RomanConverter do

  let(:roman_numerals) { generate_roman_numerals(10000) }

  context 'initialization' do

    it 'must be initialized with an argument' do
      expect{ RomanConverter.new }.to raise_error(ArgumentError)
    end

    it 'can take a String as an argument' do
      expect{ RomanConverter.new('I') }.not_to raise_error
    end

    it 'can take a Fixnum as an argument' do
      expect{ RomanConverter.new(1) }.not_to raise_error
    end

    it 'raises a typeError if argument isn\'t String or Fixnum' do
      msg = 'Argument must be a String or Fixnum'
      [:I, ['I'], {'I' => 1}].each do |argument|
        expect{ RomanConverter.new(argument) }.to raise_error(TypeError, msg)
      end
    end
  end

  context 'value attribute' do

   it 'is set to roman numeral value when initialized with String' do
      expect(RomanConverter.new('I').value).to eq 'I'
    end

    it 'is set to natural number value when initialized with Fixnum' do
      expect(RomanConverter.new(1).value).to eq 1
    end

    it 'is updated to the new roman numeral value after natural number conversion' do
      converter = RomanConverter.new(1)
      converter.convert
      expect(converter.value).to eq 'I'
    end

  end

  context 'conversions' do

    it 'can generate convertion to roman numneral at the Class level' do

      expect(RomanConverter.convert(1)).to eq 'I'
    end

    it 'can generate convertion to natural number at the Class level' do
      expect(RomanConverter.convert('I')).to eq 1
    end

    it 'can generate convertion to roman numneral at the instance level' do
      converter = RomanConverter.new(1)
      expect(converter.convert.value).to eq 'I'
    end

    it 'can generate convertion to natural number at the instance level' do
      converter = RomanConverter.new('I')
      expect(converter.convert.value).to eq 1
    end

    it 'can convert any roman numeral between "I-MMMMMMMMMM" to a natural number' do
      roman_numerals.each_with_index do |numeral, index|
        expect(RomanConverter.convert(numeral)).to eq index + 1
      end
    end

    it 'can convert any natural number between 1-10000 to a roman_numeral' do
      (1..10000).to_a.each_with_index do |number, index|
        expect(RomanConverter.convert(number)).to eq roman_numerals[index]
      end
    end
  end
end
