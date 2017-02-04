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