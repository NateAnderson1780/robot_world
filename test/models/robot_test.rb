require_relative '../test_helper'
require './app/models/robot'

class RobotTest < Minitest::Test 
  def test_assigns_attributes_correctly
    data = {"id" => 1, "name" => "Bob", "city" => "Denver", "state" => "Colorado", 
            "avatar" => "TBD", "birthdate" => "1-7-80", "date_hired" => "3-5-11", "department" => "HR"}
    
    robot = Robot.new(data)
    
    assert_equal 1, robot.id 
    assert_equal "Bob", robot.name 
    assert_equal "Denver", robot.city 
    assert_equal "Colorado", robot.state 
    assert_equal "TBD", robot.avatar 
    assert_equal "1-7-80", robot.birthdate 
    assert_equal "3-5-11", robot.date_hired 
    assert_equal "HR", robot.department 
  end
end