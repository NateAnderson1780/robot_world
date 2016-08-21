require_relative '../test_helper'
require './app/models/robot_world'
require 'pry'

class RobotWorldTest < Minitest::Test
  include TestHelpers
  
  def current_robot_id
    robot_world.all.last.id
  end
  
  def create_robot
    robot_world.create({ :name       => "some name", 
                         :city       => "some city",
                         :state      => "some state",
                         :avatar     => "some avatar",
                         :birthdate  => "1-7-80",
                         :date_hired => "3-5-11",
                         :department => "some department"})
  end
  
  def number_of_robots
    robot_world.all.count
  end
  
  def test_can_create_a_robot
    assert_equal 0, number_of_robots
    
    create_robot
    
    assert_equal 1, number_of_robots
  end
  
  def test_it_returns_all_the_robots
    3.times { create_robot }
    
    assert_equal 3, number_of_robots
    assert_instance_of Robot, robot_world.all.first
  end
  
  def test_it_finds_a_robot
    create_robot
    
    robot = robot_world.find(current_robot_id)
    
    assert_instance_of Robot, robot
  end
  
  def test_it_deletes_a_robot 
    create_robot
    assert_equal 1, number_of_robots
    
    robot_world.destroy(current_robot_id)
    assert_equal 0, number_of_robots
  end
  
  def test_it_updates_a_robot
    create_robot
    
    params = {robot: {name: "Dave", city: "Chicago",
                       state: "Illinois", avatar: "TBD",
                       birthdate: "9-10-90",
                       date_hired: "7-2-16",
                       department: "HR"}}
    
    robot_world.update(current_robot_id, params[:robot])
    
    robot = robot_world.find(current_robot_id)
    
    assert_equal "Dave", robot.name
    assert_equal "Chicago", robot.city
    assert_equal "Illinois", robot.state
    assert_equal "TBD", robot.avatar
    assert_equal "9-10-90", robot.birthdate
    assert_equal "7-2-16", robot.date_hired
    assert_equal "HR", robot.department
  end
end