# Big Brain Number Guessing

- This is a small game project that try its best to copy a game we play in class
- Game link on itch.io: https://thaiminh2022.itch.io/big-brain-number-guesser
- Supports for mobile on the web are still very limited

## Description - Disclaimer
- The game is supposed to be play by 2 players / teams
- The version of the game coded here is only for 1 player.

## Rules
- Each player / team will agreed on the number of digits the number has
- A random number is selected for each player / team, each digit in the number **has to be unique**

### Stage 1 - Guess the digits

- Each player / team takes turn to guess the digits.
- Player / team has to tell their opponent how many digits was guessed correctly.
- When a player / team guessed the correct amount of digits:
    - The player / team enter stage 2
    - The other player / team has to keep guessing in stage 1 until they guessed the correct amount of digits.

### Stage 2 - Guss the number (position of digits)

- Each player / team takes turn to guess the number with the known digits in stage 1.
- Player / team has to tell the opponent how many position was guessed correctly.
- This **repeats** until a team guessed the correct number.
- The first player / team that guessed correctly win.
