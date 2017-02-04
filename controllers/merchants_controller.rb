require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'

get '/merchants/all' do
  @merchants = Merchant.all()
  erb :"/merchants/index"
end

get '/merchants/new' do
  erb :"merchants/new"
end

post '/merchants/new' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to("/merchants/all")
end

get "/merchants/:id" do
  @merchant = Merchant.find(params[:id])
  erb :"merchants/show"
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb :"merchants/edit"
end

post "/merchants/:id" do
  @merchant = Merchant.update(params)
  redirect to ("/merchants/#{params[:id]}")
end

post "/merchants/:id/delete" do
  Merchant.delete(params[:id])
  redirect to('/merchants/all')
end