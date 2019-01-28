require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get "/gossips/new/" do
  	erb :new_gossip
  end

  post '/gossips/new/' do
  	Gossip.new(params["gossip_author"],params["gossip_content"]).save
  	redirect '/'
  end

  get '/gossips/:id' do
  	erb :profile, locals: {potins: Gossip.find(params[:id].to_i)}
  	#Gossip.find(params[:id])
  end

  get '/gossips/edit/:id' do
  	erb :edit, locals: {gossip: Gossip.find(params['id'].to_i), index_id: params['id']}
  end

  post '/gossips/edit/:id' do
  	Gossip.update(params[:id],params['update_author'],params['update_content'])
  	redirect '/'
  end


end