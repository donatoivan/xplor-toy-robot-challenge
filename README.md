# Xplor Toy Robot Challenge

This is an application built with Ruby that takes commands from the user as input. These commands are then given to a robot dictating which way the robot moves.

## Mission Statement

This my solution for the Xplor Toy Robot coding challenge. It is written in Ruby as was suggested in the challenge requirements. This is my first ever attempt at a Toy Robot solution. The program was a lot of fun to write.

## Installing requirements

I have Ruby version 2.6.1 on my machine. If the version number returned when typing `$ ruby -v` in your terminal is less than that number, install a fresh copy of Ruby just to be safe. It should be fine with anything more than version 2.2.2. Might be a good time to update Ruby anyway. 

### Install Ruby

```
$ brew install ruby
```

If you come come across any issues here is a link for some help:

[Install Ruby Documentation](https://www.ruby-lang.org/en/documentation/installation/)


## App Installation

This process will download a copy of the project to run on your local machine.

### Clone repository

```
$ git clone git@github.com:donatoivan/xplor-toy-robot-challenge.git
```

### Change into directory

```
$ cd xplor-toy-robot-challenge
```

### Run bundle install

```
$ bundle
```

### Run app

```
$ ruby runner.rb
```

## Specifications
```
Toy Robot Simulator
===================

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

Create an application that can read in commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

Constraints
-----------

- The toy robot must not fall off the table during movement. This also
  includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

Example Input and Output
------------------------

### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

Deliverables
------------

Please provide your source code, and any test code/data you using in
developing your solution.

Please engineer your solution to a standard you consider suitable for
production. It is not required to provide any graphical output showing the
movement of the toy robot.
```

## Build Process

The most difficult part of the build was organizing the logic stream into one cohesive unit. The logic I've used to move my robot around isn't the most complex; The four cadinal directions are represented as an array. The first element in the array represent the way the robot is facing. When LEFT OR RIGHT is chosen by the user the array is rotated by 1 or -1 depending on which way the user wants to turn.

I wanted to focus on input sanitization and error handling for my build. The best way I found to do this, particularly with reagrds to the PLACE command, was to use regex. That way I could be really specific with what I wanted to ask the user for in terms of input formatting. Sitting and playing around with different regular expressions was really interesting. I had used dome very bsaic ones in the past to check to see if certain string contained numbers and letters, but using it in this way showed me how powerful it can be.

For the Ascii Art in my app I used [ASCII Generator - Network Science](http://www.network-science.de/ascii/)

For the Regex in my app I used [Rubular](https://rubular.com/)

For stylistic references in rspec I used [Better Specs](http://www.betterspecs.org/) 

### Dependencies

```
gem 'rspec', '~> 3.8'
```

## Testing

My tests are predominantly made up of unit tests for my application methods. I ignored the methods that display text as all they do is print text to the CLI.

Run this command in the app root directory to run my tests:

```
$ rspec spec
```

## Epilogue

All in all a fun challenge to undertake. Had a great time revisiting ruby and writing heaps of unit tests.

Cheers.
