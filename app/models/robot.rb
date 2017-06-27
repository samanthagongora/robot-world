require 'sqlite3'

class Robot
  attr_reader :name

  def initialize(robot_params)
    @name     = robot_params["name"]
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
  end

  def self.all
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find(id)
    robot = database.execute("SELECT * FROM robots WHERE id = ?", id).first
    Robot.new(robot)
  end

  def self.database
    database = SQLite3::Database.new('db/robot_world_development.db')
    database.results_as_hash = true
    database
  end
end
