require 'pry'
require './game_logic'
require './players'
require './set_players_game'


game = StartGame.new()

game.ask_names

newGame = Logic.new(game.p1, game.p2)

newGame.questions