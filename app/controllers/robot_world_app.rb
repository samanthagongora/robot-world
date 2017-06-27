require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/robots" do
    @robots = Robot.all
    erb :index
  end

  get "/robots/new_robot" do
    erb :new_robot
  end

  get "/robots/:id" do |id|
    @robot = Robot.find(id)
    erb :show
  end

  post "/robots" do
    robot = Robot.new(params[:robot])
    robot.save
    redirect "/robots"
  end
end
