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
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    session[:the_game] = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:the_game].players[0].name
    @player_1_hp = session[:the_game].players[0].hit_points
    @player_2_name = session[:the_game].players[1].name
    @player_2_hp = session[:the_game].players[1].hit_points
    erb(:play)
  end

  post '/attack_form' do
    session[:the_game].attack(params[:attack_type], session[:the_game].players[1])
    redirect '/attack'
  end

  get '/attack' do
    @player_2_name = session[:the_game].players[1].name
    erb(:attack)
  end

  run! if app_file == $0

end
