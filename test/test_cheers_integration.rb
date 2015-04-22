require_relative 'helper'

#Scenarios discussed in class:
# 0 args -> help message
# 1 valid arg
# 1 invalid arg
# 2 args
# => valid + valid *
# => valid + invalid *
# => invalid + valid *
# => invalid + invalid *
#
# Valid Names
# => Regular name*
# => Name with hyphens*
#
# Invalid Names:
# => birthday instead of name *
# => all non-word characters *
# => "" (empty string) *
# => " " (whitespace) *
# Valid Months
# => m/dd (8/25)
# => mm/dd (08/25)
# => birthdays that already happened this year
# => birthdays that haven't happened yet this year
# Invalid Months:
# => dd/mm (25/08)
# => dd/mm/yy (08/25/2015)


class TestCheersIntegration < Minitest::Test

  def test_zero_argument_print_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
     assert_equal expected, output
  end

  def test_only_one_valid_argument
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_one_invalid_argument
    output = `./cheers 00/00`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument_name_with_space
    output =  `./cheers "Mary Jane"`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary Jane's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_empty_string
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_name_with_hyphen
    output =  `./cheers Mary-Jane`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary-Jane's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_whitespace
    output = `./cheers " "`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_non_word_characters
    output = `./cheers %$*&`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_valid_name_argument_with_invalid_date_argument
    output = `./cheers Abby 00/00`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_two_invalid_arguments
    output = `./cheers 2345 #`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_invalid_name_with_valid_date_argument
    output = `./cheers $4$5 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :( \n
Try again with './cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_two_valid_arguments
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_name_with_hyphen_with_valid_date_argument
    output =  `./cheers Mary-Jane 08/25`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary-Jane's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_date_argument_with_year
    output = `./cheers Abby 08/25/2015`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_invalid_date_argument
    output = `./cheers Abby 25/08`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby's just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end
end
