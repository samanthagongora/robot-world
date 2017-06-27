require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get "/robots/:id" do
    @robot = Robot.find(:id)
    erb :show
  end
end
