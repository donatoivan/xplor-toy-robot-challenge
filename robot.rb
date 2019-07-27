class Robot
  attr_accessor :compass, :placed, :commands
  def initialize
    @commands = []
    @compass = ["NORTH", "EAST", "SOUTH", "WEST"]
    @x_coordinate = 0
    @y_coordinate = 0
    @placed = false
  end

   # display opening image
   def landing
    puts `clear`
    print "\n\n"
    print ".-----.            .---.       .-.         .-. \n"
    print "`-. .-'            : .; :      : :        .' `.\n"
    print "  : : .--. .-..-.  :   .' .--. : `-.  .--.`. .'\n"
    print "  : :' .; :: :; :  : :.`.' .; :' .; :' .; :: : \n"
    print "  :_;`.__.'`._. ;  :_;:_;`.__.'`.__.'`.__.':_; \n"
    print "            .-. :                              \n"
    print "            `._.'                              \n"
    print " .--.  _                .-.         .-.         \n"  
    print ": .--':_;               : :        .' `.         \n" 
    print "`. `. .-.,-.,-.,-..-..-.: :   .--. `. .'.--. .--. \n"
    print " _`, :: :: ,. ,. :: :; :: :_ ' .; ; : :' .; :: ..'\n"
    print "`.__.':_;:_;:_;:_;`.__.'`.__;`.__,_;:_;`.__.':_;  \n\n\n"                                                   
    print "Welcome to the Toy Robot Simulator!\n\n"
    print "This program is a lightweight simulator of a toy robot moving on a square tabletop.\n"
    print "Instruct your robot to move via commands in the CLI.\n"
    print "To continue, please select one of the following options:\n\n"
  end

  def menu
    print "\nInput Options:\n"
    print "\n[c] Enter C to type in a command for the robot\n"
    print "[q] Enter Q to quit the program\n\n"
    print ':'
  end
end