## [10 - Game of Life](https://github.com/yrgo/gp20/tree/master/Programming%20Fundamentals/10%20-%20Game%20of%20Life)

<img src="https://cdn.discordapp.com/attachments/739800321689255999/765585353972252682/game_of_life.gif">

<img src="blob:https://giphy.com/f3d69b2d-a122-460f-99d2-de4f5e4dd86c">

## Assignments
You have about 2 weeks to complete the assignment.  
**Deadline:** Sunday 25th of October 23:59.  

1. Make your _own_ version of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). Do not just copy a solution online. A starting template will be made during the lesson and available in the resources folder.

    > **Rules of the game:**
    > - Any live cell with fewer than two live neighbors dies, as if caused by underpopulation.
    > - Any live cell with two or three live neighbors lives on to the next generation.
    > - Any live cell with more than three live neighbors dies, as if by overpopulation.
    > - Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.  

2. Upload the assignment to GitHub as usual, create a README.md file for it and add a screenshot or small gif of your program running.


## Extracurricular
1. Improve the program with the some of the following features:
    - Visual effects, particles, fades, color, color over lifetime.
    - Add trails showing where pieces have been.
    - Add controls so you can change the speed of the simulation.
    - See if you can detect when/if the simulation becomes stable.
      - How many generations before this happens?
    - Try using different ways of filling the grid from the start.
      - Different fill percentage.
      - Create a start screen where you can select starting point.
      - Try spawning the acorn, see image below.
      - Use an image to generate the start point.
    - It's possible to complete the assignment only using a standard array (instead of a matrix (double array)). See if you can figure it out.
    - Add controls to zoom in or out of the simulation.

2. Convert your program so you can run it in the web version of processing ([p5.js](https://p5js.org/)). Using this cool online tool: https://teddavis.org/p5live/


<img src="https://upload.wikimedia.org/wikipedia/commons/b/b9/Game_of_life_acorn.svg" alt="the Acorn">  

The acorn
