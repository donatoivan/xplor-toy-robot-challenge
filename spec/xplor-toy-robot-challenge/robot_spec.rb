require 'rspec'
require './robot.rb'

describe Robot do
  describe '#accessors' do
    subject(:robot) { described_class.new }

    it 'has initial x coordinate value of zero' do
      expect(robot.x_coordinate).to be(0)
    end

    it 'has initial y coordinate value of zero' do
      expect(robot.y_coordinate).to be(0)
    end

    it 'has initial placed value of false' do
      expect(robot.placed).to be(false)
    end

    it 'has inital compass array with first value of North' do
      expect(robot.compass.first).to eql('NORTH')
    end

    it 'has inital menu_option with empty value' do
      expect(robot.menu_option.empty?).to be(true)
    end

    context 'when turning left or right' do
      it 'faces East on one rotation to the right' do
        robot.compass.rotate!(1)
        expect(robot.compass.first).to eql('EAST')
      end

      it 'faces West on two rotations to the left' do
        robot.compass.rotate!(-1)
        expect(robot.compass.first).to eql('WEST')
      end
    end
  end

  describe '.rotate_right' do
    subject(:robot) { described_class.new }
    
    it "doesn't rotate when robot is not placed on board" do
      robot.rotate_right
      expect(robot.compass.first).to eql('NORTH')
    end

    it 'rotates right once and faces east' do
      robot.placed = true
      robot.rotate_right
      expect(robot.compass.first).to eql('EAST')
    end
  end

  describe '.rotate_left' do
    subject(:robot) { described_class.new }
    
    it "doesn't rotate when robot is not placed on board" do
      robot.rotate_left
      expect(robot.compass.first).to eql('NORTH')
    end

    it 'rotates right once and faces east' do
      robot.placed = true
      robot.rotate_left
      expect(robot.compass.first).to eql('WEST')
    end
  end

  describe '.report' do
    subject(:robot) { described_class.new }

    it 'prints x and y coordinates, direction facing' do
      robot.x_coordinate = 1
      robot.y_coordinate = 3
      robot.compass[0]

      expect(STDOUT).to receive(:puts).with("Command Ignored. Place Robot on table to proceed e.g. PLACE 0,0,NORTH")
      robot.report
    end
  end

  describe '.place' do
    subject(:robot) { described_class.new }

    it 'places robot on the table' do
      robot.place('PLACE 1,1,NORTH')
      expect(robot.placed).to be(true)
    end

    it 'sets x coordinate when placed' do 
      robot.place('PLACE 3,2,EAST')
      expect(robot.x_coordinate).to be(3)
    end

    it 'sets y coordinate when placed' do 
      robot.place('PLACE 4,1,WEST')
      expect(robot.y_coordinate).to be(1)
    end
    
    it 'rotates the compass to face the right way' do
      robot.place('PLACE 4,1,WEST')
      expect(robot.compass[0]).to eql('WEST')
    end
  end

  describe '.move' do
    subject(:robot) { described_class.new }

    it 'does not register a move if robot is not placed on table' do
      robot.move(robot.compass[0])
      expect(robot.x_coordinate).to be(0)
    end

    it 'moves forward one if robot is placed on table' do
      robot.placed = true
      robot.move(robot.compass[0])
      expect(robot.x_coordinate).to be(1)
    end

    it 'runs check_limits and triggers it if reaches table limit' do
      robot.placed = true
     
      expect(STDOUT).to receive(:puts).with("I'm already living on the edge")
      robot.move(robot.compass[0])
      robot.move(robot.compass[0])
      robot.move(robot.compass[0])
      robot.move(robot.compass[0])
      robot.move(robot.compass[0])
    end
  end

  describe '.check_limits' do
    subject(:robot) { described_class.new }

    it 'outputs message if x coordinate exceeds value of 4' do
      robot.x_coordinate = 5
      expect(STDOUT).to receive(:puts).with("I'm already living on the edge")
      robot.check_limits
    end

    it 'outputs message if x coordinate is less than 0' do
      robot.x_coordinate = -1
      expect(STDOUT).to receive(:puts).with("I'm already living on the edge")
      robot.check_limits
    end

    it 'outputs message if y coordinate exceeds value of 4' do
      robot.y_coordinate = 5
      expect(STDOUT).to receive(:puts).with("I'm already living on the edge")
      robot.check_limits
    end

    it 'outputs message if y coordinate is less than 0' do
      robot.y_coordinate = -1
      expect(STDOUT).to receive(:puts).with("I'm already living on the edge")
      robot.check_limits
    end
  end

  describe '.invalid_place' do
    subject(:robot) { described_class.new }

    it 'returns true if place command is invalid' do 
      expect(robot.invalid_place('ajdadaksjd')).to be(true)
    end

    it 'returns true if place command is lowercase' do 
      expect(robot.invalid_place('place 1,1,north')).to be(true)
    end

    it 'returns true if spaces are added to input' do 
      expect(robot.invalid_place('PLACE 1,1, NORTH')).to be(true)
    end

    it 'returns true if commas are forgotten' do 
      expect(robot.invalid_place('PLACE 11, NORTH')).to be(true)
    end

    it 'returns true if x or y coordinates are above 4' do 
      expect(robot.invalid_place('PLACE 5,5, NORTH')).to be(true)
    end

    it 'returns true if x or y coordinates are below 0' do 
      expect(robot.invalid_place('PLACE -1,-1, NORTH')).to be(true)
    end

    it 'returns false if place command is valid' do 
      expect(robot.invalid_place('PLACE 1,1,NORTH')).to be(false)
    end
  end
end