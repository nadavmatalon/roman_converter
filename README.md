#Roman Converter

[![Code Climate](https://codeclimate.com/github/nadavmatalon/roman_converter/badges/gpa.svg)](https://codeclimate.com/github/nadavmatalon/roman_converter)

## Table of Contents

* [General Description](#general-description)
* [How to Install and Run](#how-to-install-and-run)
* [Testing](#testing)
* [License](#license)

##General Description

The 'Roman Converter' can be used to convert any roman numeral string 
(e.g. 'XXV') to a natural number and any natural number 
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

The `convert` Class method can then be used with either a `String` or a 
`Fixnum` as follows:

```ruby
>> RomanConverter.convert('XXV')
=> 25
>> RomanConverter.convert(25)
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

