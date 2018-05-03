require 'sinatra/base'
require './lib/player'
require './lib/game'

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
    @game = session[:the_game]
    erb(:play)
  end

  post '/attack_form' do
    @game = session[:the_game]
    attack_type = params[:attack_type]
    attacking = params[:attacking]
    @game.attack(attack_type, attacking)
    redirect "/attack?player=#{attacking}"
  end

  get '/attack' do
    @game = session[:the_game]
    @selected_player = params[:player].name
    erb(:attack)
  end

  run! if app_file == $0

end
