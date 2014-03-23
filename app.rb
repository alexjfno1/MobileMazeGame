require 'sinatra'
require 'sinatra/assetpack'

register Sinatra::AssetPack

assets {
  js :maze, ['/js/*.js']
  css :maze, ['/css/*.css']
}

get '/' do
  erb :maze
end
