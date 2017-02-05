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

post '/tags/new' do
  @tag = Tag.new(params)
  @tag.save
  redirect to("/tags/all")
end

get "/tags/:id" do
  @total_spend = Tag.total_spend(params[:id])
  @tag = Tag.find(params[:id])
  erb :"tags/show"
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb :"tags/edit"
end

post "/tags/:id" do
  @tag = Tag.update(params)
  redirect to ("/tags/#{params[:id]}")
end

post "/tags/:id/delete" do
  Tag.delete(params[:id])
  redirect to('/tags/all')
end
