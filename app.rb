require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
  end

  

  # get '/' do
  #   'Hello Battle!'
  #   'Testing infrastructure working!'
  # end

  get '/' do
    erb :index
  end

  post '/names' do
    # @player_1_name = params[:player_1_name]
    # @player_2_name = params[:player_2_name]
    # session[:player_1_name] = params[:player_1_name]
    # session[:player_2_name] = params[:player_2_name]
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    # @player_1_name = session[:player_1_name]
    # @player_2_name = session[:player_2_name]
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :play
  end 

  get '/attack' do
    # @player_1_name = session[:player_1_name]
    # @player_2_name = session[:player_2_name]
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

