require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'

get '/transactions/all' do
  @transactions = Transaction.all()
  erb :"/transactions/index"
end

get '/transactions/new' do
  erb :"transactions/new"
end

post '/transactions/new' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions/all")
end

