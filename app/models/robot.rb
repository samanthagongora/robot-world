require 'sqlite3'

class Robot
  attr_reader :name, :id

  def initialize(robot_params)
    @id       = robot_params["id"] if robot_params["id"]
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
