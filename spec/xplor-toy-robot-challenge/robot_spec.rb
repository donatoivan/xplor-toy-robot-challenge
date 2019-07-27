require 'rspec'
require './robot.rb'

describe Robot do
  describe '#accessors' do
    subject(:robot) { described_class.new }

    it 'has initial empty command array' do
      expect(robot.commands.empty?).to be(true)
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
end