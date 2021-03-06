Bundler.require :web
Bundler.require :development if development?

use Rack::Coffee, root: 'assets', urls: '/javascripts'

get '/style.css' do
  scss :style
end

get '/' do

  board = []

  cards = ['apple', 'orange', 'banana', 'airplane', 'dog', 'cat', 'car',
           'house', 'tree', 'firetruck', 'lion', 'elephant']

  cards.cycle(2) { |x| board.push(x) }

  @board = board.shuffle

  haml :index
end

not_found do
  haml :'404'
end
