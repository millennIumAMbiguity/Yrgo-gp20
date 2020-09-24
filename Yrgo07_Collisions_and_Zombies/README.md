## [07 - Collisions and Zombies](https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/07%20-%20Collision%20and%20Zombies)

<img src="https://cdn.discordapp.com/attachments/739800321689255999/758389145122111538/unknown.png">

## Assignments
1. Create a new class called character and make a character manager. (the character should initially behave like the ball class from previous lecture).
2. Create a Human class that extends from the character class.
3. Create a Zombie class that inherits from character, but they are slower (and green).
4. Let the character manager spawn 99 humans and 1 Zombie.
5. Let the manager check if a Zombie "collies" with a human.
If they collide, replace the Human with a new Zombie.  
(there are several reasons for not doing it this way, more on that later).
6. When a human (or zombie) gets to the edge, they do not bounce like the balls, instead they screen warp to the other side.
7. When all humans are (un)dead [print](https://processing.org/reference/text_.html) GAME OVER on the screen and how long it took before all died (time since the program started).


## Extracurricular
1. Look at the following [article](https://www.washingtonpost.com/graphics/2020/world/corona-simulator/) (click read now and then agree). Will the humans live longer if they use social distancing?
2. Improve the art of the program a bit.
   - Make the humans have slightly different sizes and colors.
   - Give the zombies arms that always points forward.
3. Create some more interesting movement behaviors for the humans.
    - They walk a set distance, selects a new random destination and moves on.
    - Humans should turn a maximum of 90 degrees.
4. Make the zombies follow the closest human.