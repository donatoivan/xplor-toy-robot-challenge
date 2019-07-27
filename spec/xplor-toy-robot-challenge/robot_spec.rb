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
    
    it 'doesn\'t rotate when robot is not placed on board' do
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
    
    it 'doesn\'t rotate when robot is not placed on board' do
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

      expect(STDOUT).to receive(:puts).with('1,3,NORTH')
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

    it 'does not register moves if robot is not placed on table' do
      robot.move(robot.compass[0])
      expect(robot.x_coordinate).to be(0)
    end

    it 'moves forward one if robot is placed on table' do
      robot.placed = true
      robot.move(robot.compass[0])
      expect(robot.x_coordinate).to be(1)
    end
  end
end