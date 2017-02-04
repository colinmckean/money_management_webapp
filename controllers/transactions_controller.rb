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

post '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect to ("/transactions/#{params[:id]}")
end

post '/transactions/:id/delete' do
    Transaction.delete(params[:id])
    redirect to('/transactions/all')
end

get '/transactions/new' do
  erb :"transactions/new"
end

post '/transactions/new' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions/all")
end

