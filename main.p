import random
import words
# this re library is not used, we did this manually
import re


game_status = "YES"
while game_status == "YES":
    list_dictionary = {1: words.Names,
                       2: words.Fruits,
                       3: words.Countries,
                       4: words.Sportsmen,
                       5: words.Cars}
    user_choice = int(input("Choose Category:-\n"
                            "1 -> Names\n"
                            "2 -> Fruits\n"
                            "3 -> Countries\n"
                            "4 -> Sportsmen\n"
                            "5 -> Cars\n"
                            "Enter a number to choose: "))
    random_word = random.choice(list_dictionary[user_choice])
    # a line of code that used ( re library ) to replace all letters to ( _ )
    # Cyphered_random_word = re.sub(r'[a-zA-Z]', '_', random_word)
    # but im going to do this without library ->
    Cyphered_random_word = ""
    for letter in range(len(random_word)):
        Cyphered_random_word += "_"
    counter = 3
    guessed_letter = ""
    duplicated_word = list(random_word)
    hint_needed = ''
    print(f"Guess the word\n{Cyphered_random_word}\n")
    while Cyphered_random_word.count("_") >= 1 and counter != 0:
        # takes a letter from the user as a guess
        guessed_letter = input("Enter a char: ").capitalize()
        if random_word.count(guessed_letter) >= 1:
            # if there exist the guessed letter inside that random generated word, then go inside if statement
            for i in range(len(random_word)):
                if random_word[i] == guessed_letter:
                    # convert the string to a list, so we can replace the ("_") to letters
                    # ( cannot be done when its string )
                    Cyphered_random_word = list(Cyphered_random_word)
                    Cyphered_random_word[i] = guessed_letter
                    Cyphered_random_word = "".join(Cyphered_random_word)
                    if guessed_letter in duplicated_word:
                        duplicated_word.remove(guessed_letter)
        else:
            print("Wrong guess !")
            counter -= 1
            print(f"You have got {counter} more tries")
            hint_needed = input("Do you need a hint ? (Yes / No)\n Write here: ").upper()
            if hint_needed == 'YES':
                given_letter_as_hint = random.choice(duplicated_word)
                print(f"Here is a hint: {given_letter_as_hint}")
                duplicated_word.remove(given_letter_as_hint)

        print(Cyphered_random_word)
    print(f"The answer is {random_word} !")
    game_status = input("\n\nDo you wanna play again ? (Yes / No )\nEnter here: ").upper()
