require 'yaml/store'
require_relative 'robot'

class RobotWorld
  attr_reader :database 
  
  def initialize(database)
    @database = database 
  end 
  
  def create(robot)
    database.execute("INSERT INTO robots(name, city,
                     state, avatar, birthdate,
                     date_hired, department)
                     VALUES('#{robot[:name]}', 
                     '#{robot[:city]}', '#{robot[:state]}',
                     '#{robot[:avatar]}', '#{robot[:birthdate]}',
                     '#{robot[:date_hired]}', '#{robot[:department]}');")
  end
  
  def raw_robots
    database.execute("SELECT * FROM robots;")
  end
  
  def all 
    raw_robots.map { |data| Robot.new(data) }
  end
  
  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id = #{id};").first
  end
  
  def find(id)
    Robot.new(raw_robot(id))
  end
  
  def update(id, robot_data)
    database.execute("UPDATE robots SET name = '#{robot_data[:name]}',
                                        city = '#{robot_data[:city]}',
                                        state = '#{robot_data[:state]}',
                                        avatar = '#{robot_data[:avatar]}',
                                        birthdate = '#{robot_data[:birthdate]}',
                                        date_hired = '#{robot_data[:date_hired]}',
                                        department = '#{robot_data[:department]}'
                      WHERE id = #{id};")
  end
  
  def destroy(id)
    database.execute("DELETE FROM robots WHERE id = #{id};")
  end
  
  def destroy_all
    database.execute("DELETE FROM robots;")
  end
  
  def average_robot_age
    total_age = all.map { |robot| robot.age }.reduce(:+)
    total_age / all.count
  end
  
  def hiring_year_of_robots
    if years_robots_were_hired.count == 1 
      "Our robot was hired in #{years_robots_were_hired.join}"
    else
      "Our robots were hired in #{years_robots_were_hired.first} and #{years_robots_were_hired.last}"
    end
  end
  
  def years_robots_were_hired
    robot_hiring_years = all.map do |robot|
      robot.date_hired[-2..-1] 
    end
  end

end