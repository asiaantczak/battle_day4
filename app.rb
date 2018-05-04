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

  before do
    @game = session[:the_game]
  end

  get '/play' do
    erb(:play)
  end

  post '/attack_form' do
    if params[:attacking] == 'player_2'
      session['attacking'] = @game.player_2
    else
      session['attacking'] = @game.player_1
    end

    @game.attack('normal', session['attacking'])
    redirect "/attack"
  end

  get '/attack' do
    @attacking = session['attacking']
    erb(:attack)
  end

  run! if app_file == $0

end
