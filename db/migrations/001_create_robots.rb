# db/migrations/001_create_robots.rb

require 'sqlite3'

environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/robot_world_#{environment}.db")
  database.execute("CREATE TABLE robots (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name VARCHAR(64),
                    city VARCHAR(64),
                    state VARCHAR(64),
                    avatar VARCHAR(25),
                    birthdate VARCHAR(25),
                    date_hired VARCHAR(25), 
                    department VARCHAR(25) );"
                  )
  puts "creating robots table for #{environment}"
end

