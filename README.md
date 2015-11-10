# TwistScript
TwistScript is a "modification" to GolfScript that makes it... more interesting. When TwistScript is run on a program, it takes the SHA-512 hash of the file and uses it to seed a random number generator. Then, it generates a random GolfScript program between 0 to 10 bytes in length for every possible "instruction." It then picks random instructions from the program and puts their corresponding GolfScript programs into a string until there are no instructions left in the file, at which point it runs GolfScript on the created program.

# Running

Place TwistScript in the same directory as the GolfScript interpreter. Then, run it like so:

`ruby twistscript.rb <FILE> <<< INPUT`
