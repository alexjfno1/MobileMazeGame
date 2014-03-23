require 'sinatra'
require 'sinatra/assetpack'

register Sinatra::AssetPack

assets {
  css :maze, ['/css/*.css']
  js :maze, [
    '/js/mazeCanvas.js',
    '/js/walls.js',
    '/js/maze.js',
    '/js/ballControl.js',
    '/js/start.js'
  ]
}

get '/' do
  erb :maze
end
