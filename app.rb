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
    @game = session[:the_game]
    erb(:play)
  end

  post '/attack_form' do
    @game = session[:the_game]
    @game.attack(params[:attack_type], @game.player_2)
    redirect '/attack'
  end

  get '/attack' do
    @game = session[:the_game]
    erb(:attack)
  end

  run! if app_file == $0

end
