require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest
  def test_user_can_edit_a_robot
    # create example tasks
    robot_world.create({name: "Roboto",
                        city: "Denver",
                        state: "Colorado",
                        avatar: "TBD",
                        birthdate: "1-7-80",
                        date_hired: "3-5-11",
                        department: "Electronics"})
    
    visit '/robots/1/edit'
    assert '/robots/1/edit', current_path
    
    fill_in("robot[name]", :with => "Bob")
    click_on("submit")
    
    assert page.has_content?("Bob")
    assert '/robots/1', current_path
  end
                        
end