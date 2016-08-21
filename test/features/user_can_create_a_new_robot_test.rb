require_relative '../test_helper'

class UserCanCreateANewRobotTest < FeatureTest

  def test_users_can_create_a_new_robot 
    visit '/'
    click_link("New Robot")
    assert '/robots/new', current_path 
    
    fill_in("robot[name]", :with => "Bob")
    fill_in("robot[city]", :with => "Los Angeles")
    fill_in("robot[state]", :with => "California")
    fill_in("robot[avatar]", :with => "TBD")
    fill_in("robot[birthdate]", :with => "1-1-01")
    fill_in("robot[date_hired]", :with => "1-1-16")
    fill_in("robot[department]", :with => "Improv")
    click_on("submit")
    # save_and_open_page
    
    assert page.has_content?("Bob")
  end
  
end

