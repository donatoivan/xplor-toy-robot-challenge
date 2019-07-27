class Robot
  attr_accessor :compass, :placed, :commands, :menu_option
  def initialize
    @commands = []
    @compass = ["NORTH", "EAST", "SOUTH", "WEST"]
    @menu_option = ''
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

    # get user input
    @menu_option = gets.strip.downcase

    case @menu_option
    when 'c'
      puts @menu_option
      puts `clear`
      explain_commands
    when 'q'
      # exit app
      exit_app
    else
      puts "\n\nInvalid option. Try again"
      menu
    end
  end

  def exit_app
    puts `clear`
    print ".---.               .-..-..-.\n"
    print ": .; :              : :: :: :\n"
    print ":   .'.-..-. .--.   : :: :: :\n"
    print ": .; :: :; :' '_.'  :_;:_;:_;\n"
    print ":___.'`._. ;`.__.'  :_;:_;:_;\n"
    print "       .-. :                 \n"
    print "       `._.'                 \n\n\n"
    exit
  end

  def explain_commands
    print "### Available commands:\n"
    print "* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.\n"
    print "* MOVE will move the toy robot one unit forward in the direction it is currently facing.\n"
    print "* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.\n"
    print "* REPORT will announce the X,Y and F of the robot. \n\n"
    print " Any move that would cause the robot to fall will be ignored.\n"
    print "[q] Enter Q to quit the program\n"
    print " The dimensions of the table are 5 units x 5 units (co-ordinates beyond (4,4) will not be accepted.\n"
    print " A robot that is not on the table will ignore the MOVE, LEFT, RIGHT and REPORT commands.\n\n"
    print "### Example\n\n"
    print "PLACE 0,0,NORTH\n"
    print "MOVE\n"
    print "REPORT\n\n"
    print "Expected output:\n"
    print "0,1,NORTH\n\n"
    print ':'
  end

  def rotate_right
    return if @placed == false
    @compass.rotate!(1)
  end

  def rotate_left
    return if @placed == false
    @compass.rotate!(-1)
  end

  def report
    puts "#{@x_coordinate},#{@y_coordinate},#{@compass[0]}"
  end

  def place(string)
    @x_coordinate = string[6].to_i
    @y_coordinate = string[8].to_i
    @placed = true

    case string[10..-1]
    when 'NORTH'
      @compass.rotate!(0)
    when 'EAST'
      @compass.rotate!(1)
    when 'SOUTH'
      @compass.rotate!(2)
    when 'WEST'
      @compass.rotate!(3)
    end
  end

  def move(facing)
    return if @placed == false
    case facing
    when 'NORTH'
      @x_coordinate += 1
    when 'EAST'
      @y_coordinate += 1
    when 'SOUTH'
      @x_coordinate -= 1
    when 'WEST'
      @y_coordinate -= 1
    end
    check_limits
  end

  def check_limits
    if @x_coordinate > 4
      puts "I'm already living on the edge"
      @x_coordinate -= 1
    elsif @y_coordinate > 4
      puts "I'm already living on the edge"
      @y_coordinate -= 1
    elsif @x_coordinate < 0 
      puts "I'm already living on the edge"
      @x_coordinate += 1
    elsif @y_coordinate < 0 
      puts "I'm already living on the edge"
      @y_coordinate += 1
    end
  end

  def invalid_place(string)
    return true if string.scan(/(\b(\w*PLACE\w*)\b )[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/).empty?

    false
  end

  def user_input
    @string = gets.strip

    if @string[0] == "p" || @string[0] == "P"
      if invalid_place(@string)
        puts `clear`
        print "### Incorrect Format ###\n\n"
        explain_commands
      elsif !invalid_place(@string)
        place(@string)
      end
    elsif @string == "MOVE"
      move(@compass[0])
    elsif @string == "LEFT"
      rotate_left
    elsif @string == "RIGHT"
      rotate_right
    elsif @string == "REPORT"
      report
    elsif @string == "q" || @string == "Q"
      exit_app
    else
      puts `clear`
      print "### Incorrect Format ###\n\n"
      explain_commands
    end
  end

  def run
    landing
    menu
    loop do
      user_input
    end
  end
end