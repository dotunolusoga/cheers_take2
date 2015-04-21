# cheers_take2
Ruby cheers exercise (see: dotunolusoga/cheers), this time 3 weeks into learning Ruby, with tests

#Instructions

#Specifications

Start the program by running './cheers.rb'

The program should ask:

> "Hello! What is your name?"

The user types in their name, for example;

> Abby

The program outputs a cheer in the following form;

> Give me an... A
> Give me a... B
> Give me a... B
> Give me a... Y
> ABBY’s just GRAND!
> When given the input of “Abby”.

* Follow the proper grammatical for a and an. The rule is based on whether the spelling of a letter would begin with a vowel
* Strip out all special characters (i.e non-word characters)
* Print the user's name out as it was originally input for the "just GRAND" line
* If there was no input, ask again

After printing out the user's cheer, the program asks;

> Hey, Abby, what's your birthday? (mm/dd)

The user types in their birthday

> 08/25

* If there was no input, asks again until valid input is provided
* If there was input that couldn't be parsed, the program tries again, but with the prompt:

> I couldn't understand that. Could you give that to me in mm/dd format?

The program then outputs the number of days until the user's birthday

> Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
