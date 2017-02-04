require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'

get '/tags/all' do
  @tags = Tag.all()
  erb :"/tags/index"
end

get '/tags/new' do
  erb :"tags/new"
end

get "/tags/:id" do
  @tag = Tag.find(params[:id])
  erb :"tags/show"
end

post '/tags/new' do
  @tag = Tag.new(params)
  @tag.save
  redirect to("/tags/all")
end

