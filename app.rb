require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  configure do
   enable :sessions
   set :session_secret, "My session secret"
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new
    $player_2 = Player.new
    $player_1.set_name(params[:player_1_name])
    $player_2.set_name(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack_form' do
    value = 10 if params[:attack_type] == 'attack'
    $player_2.reduce_hit_points(10)
    redirect '/attack'
  end


  get '/attack' do
    erb(:attack)
  end

  run! if app_file == $0

end
