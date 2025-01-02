# Pong

This project is a recreation of the first game developed by Atari in 1972, "PONG".

# Reflection

The motivation behind this project was to explore the fundamentals of programming
during my early stages of learning to program. The first software language
I came to learn was processing. Despite the struggles of grasping the concepts
in the beginning, I sought to learn programming in a much more enjoyable manner
in my opinion by embarking on building personal projects such as this one. 

Started around 2020, I stumbled upon an [example in processing](https://processing.org/examples/bounce.html) 
where a ball bounces around the screen. This sparked my motivation to recreate
the game pong using processing. 

After some months, I had the core concepts of the game implemented with two
paddles that can be controlled by key presses and the ball bouncing within
its constrained boundaries and even some additional features such as a powerup
called "SlamBall". However, it was nowhere near perfect. Some work was needed to
be done so I created a TODO list. Unfortunately, after some time, I decided the
codebase was "good enough" from a beginner software developer's perspective. This
will come to haunt me in the later years when I have gained a little more experience
in programming. So I set this project aside in pursuing other projects during
the time that suited my interests.

Until recently around the end of 2024, I realized I had to finish my first 
project as it did not settle right with me to have unfinished projects. I
did not like how the code was written and how disorganized it was, so I made a 
major clean up to the source code. Only until I was satisfied with the current
state of the code, I then moved on to fixing some bugs and adding features such as
a start menu and user specifications. 

It turns out that this project was not a small feat. Despite the efforts to 
complete the project there are still lots of work needed. I learned that in
software, persistance and motivation is key. For any given project, there are
always ways to improve, to add, to change that is only limited by one's own
motivation and determination. 

# Instructions

Processing can be installed [here](https://processing.org/download). By cloning
this repository, you can run it in processing.

Upon startup, you will be greeted with a start menu which allows the user to 
specify the different modes.

![Start Menu Processing](/images//pong_start_menu.png)

Mouse hovering over the help option will show the instructions for playing the game. 
Clicking start game will introduce additional options for specifying single player
or two player mode. Also the max points to win can also be incremented or decremented.

![Player Selection](/images//player_selection.png)

There are three difficulty modes: "easy", "normal", "hard". Harder difficulties will
mean a faster ball speed and a slower paddle speed. The opposite is true for
easier difficulties. For single player mode, the A.I. is less prone to making mistakes
in harder difficulties.

![Startup](/images//startup.png)

Upon startup, pressing "g" starts the game. Otherwise, the user can click "q" to 
go back to main menu.

To control paddle one (left), the keys "w" and "s" are used. To move up, press "w",
to move down press "s". To control paddle two (right), the up and down arrow
keys are used. To move up, press the up arrow key, to move down press the down
arrow key.

![Sample Game](/images//game.png)

Once a player wins, the user can either restart the game by pressing "r" or go 
back to the main menu by pressing "q".

![End Game](/images//endgame.png)

