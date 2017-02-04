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