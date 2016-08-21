require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_all_robots 
    # create example robots
    robot_world.create({name: "Roboto",
                        city: "Denver",
                        state: "Colorado",
                        avatar: "TBD",
                        birthdate: "1-7-80",
                        date_hired: "3-5-11",
                        department: "Electronics"})
    robot_world.create({name: "Mr. Robot",
                        city: "Chicago",
                        state: "Illinois",
                        avatar: "TBD",
                        birthdate: "11-7-80",
                        date_hired: "9-5-11",
                        department: "HR"})
                         
    # visit robots page
    visit '/robots'
    
    
    # save_and_open_page
    
    assert page.has_content?, ('(1) Roboto')
    assert page.has_content?, ('(2) Mr. Robot')
  end
  
end

