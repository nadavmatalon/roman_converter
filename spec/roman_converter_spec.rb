describe RomanConverter do

  let (:roman_numerals)    { generate_roman_numerals(10000) }
  let (:converter_numeral) { RomanConverter.new('I') }
  let (:converter_natural) { RomanConverter.new(1) }

  context 'initialization' do

    it 'must be initialized with an argument' do
      expect{ RomanConverter.new }.to raise_error(ArgumentError)
    end

   it 'must be initialized with a single argument' do
      expect{ RomanConverter.new('I', 'I') }.to raise_error(ArgumentError)
    end

    it 'can be done with a String argument' do
      expect{ converter_numeral }.not_to raise_error
    end

    it 'can be done with a Fixnum argument' do
      expect{ converter_natural }.not_to raise_error
    end

    it 'raises an exception if argument is not a String or Fixnum' do
      msg = 'Argument must be a String or Fixnum'
      [:I, ['I'], {'I' => 1}].each do |argument|
        expect{ RomanConverter.new(argument) }.to raise_error(TypeError, msg)
      end
    end
  end

  context 'value attribute' do

   it 'is set to roman numeral value following initialization with a String' do
      expect(converter_numeral.value).to eq 'I'
    end

    it 'is set to natural number value following initialization with a Fixnum' do
      expect(converter_natural.value).to eq 1
    end

    it 'is updated to new value after convertion to roman numeral' do
      converter_natural.convert
      expect(converter_natural.value).to eq 'I'
    end

    it 'is updated to new value after conversion to natural number' do
      converter_numeral.convert
      expect(converter_numeral.value).to eq 1
    end
  end

  context 'conversions' do

    it 'to a roman numneral can be done at the Class level' do
      expect(RomanConverter.convert(1)).to eq 'I'
    end

    it 'to a natural number can be done at the Class level' do
      expect(RomanConverter.convert('I')).to eq 1
    end

    it 'to a roman numneral can be done at the Instance level' do
      expect(converter_natural.convert.value).to eq 'I'
    end

    it 'to a natural number can be done at the Instance level' do
      expect(converter_numeral.convert.value).to eq 1
    end

    it 'to roman numerals work for values between "1-10000"' do
      (1..10000).to_a.each_with_index do |number, index|
        expect(RomanConverter.convert(number)).to eq roman_numerals[index]
      end
    end

    it 'to natural numbers work for values between "I-MMMMMMMMMM"' do
      roman_numerals.each_with_index do |numeral, index|
        expect(RomanConverter.convert(numeral)).to eq index + 1
      end
    end

    it 'can be chained together' do
      [converter_numeral, converter_natural].each do |converter|
        expect{ converter.convert.convert }.not_to raise_error
      end
    end

    it 'will reverse the value with each chained conversion' do
      expect(converter_numeral.convert.convert.value).to eq 'I'
      expect(converter_numeral.convert.convert.convert.value).to eq 1
    end
  end
end
