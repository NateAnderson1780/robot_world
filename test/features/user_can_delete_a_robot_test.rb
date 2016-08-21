require_relative '../test_helper'

class UserCanDeleteARobotTest < FeatureTest
  def test_users_can_delete_a_robot 
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
    
    assert page.has_content?("Bob")
    assert '/robots', current_path
    
    click_link("name")
    assert '/robots/:id', current_path
    click_on("Delete")
    
    refute page.has_content?("Bob")
    assert '/robots', current_path
  end
  
end