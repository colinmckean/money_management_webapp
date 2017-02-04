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

get "/transactions/:id" do
  @transaction = Transaction.find(params[:id])
  erb :"transactions/show"
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb :"transactions/edit"
end

get '/transactions/new' do
  erb :"transactions/new"
end

post '/transactions/new' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions/all")
end

