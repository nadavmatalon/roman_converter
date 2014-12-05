#Roman Converter

[![Code Climate](https://codeclimate.com/github/nadavmatalon/roman_converter/badges/gpa.svg)](https://codeclimate.com/github/nadavmatalon/roman_converter)

## Table of Contents

* [General Description](#general-description)
* [How to Install and Run](#how-to-install-and-run)
* [Functional Description](#functional-description)
* [Testing](#testing)
* [License](#license)

##General Description

The 'Roman Converter' wraps a converter app that can be used to convert 
any roman numeral string (e.g. 'XXV') to a natural number and any natural number 
(e.g. 25) to a roman numeral string (the code is tested up to 
"MMMMMMMMMM" and 10,000 respectively).

The code was written in [Ruby](https://www.ruby-lang.org/en/) (2.1.1) 
using [TDD](http://en.wikipedia.org/wiki/Test-driven_development) methodology
following the course at [Makers Academy](http://www.makersacademy.com/), 


##How to Install and Run

First, __clone the repo__ to a local folder and then run:

```
$> cd roman_converter
$> bundle install
$> irb
>> require './lib/roman_converter.rb'
```


##Functional Description

There are two ways to use the Roman Converter app.

First, directly by employing the `convert` Class methdod:

```ruby
>> RomanConverter.convert('XXV')
=> 25
>> RomanConverter.convert(25)
=> "XXV"
```

Second, by initializing a RomanConverter object and then employing 
the `convert` and `value` Instance methods:

```ruby
>> converter = RomanConverter.new('XXV')
=> #<RomanConverter:0x000001037f21b0 @value="XXV">
>> converter.convert
=> #<RomanConverter:0x000001037f21b0 @value=25>
>> converter.value
=> 25

>> converter = RomanConverter.new(25)
=> #<RomanConverter:0x00000103791c20 @value=25>
>> converter.convert
=> #<RomanConverter:0x00000103791c20 @value="XXV">
>> converter.value
=> "XXV"
```


##Testing

Tests were written with [Rspec](http://rspec.info/) (3.1.7).

To run the tests in terminal: 

```bash
$> cd roman_converter
$> rspec
```

##License

<p>Released under the <a href="http://www.opensource.org/licenses/MIT">MIT license</a>.</p>

