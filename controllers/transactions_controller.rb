require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'

get '/transactions/all' do
  @total_spend = Transaction.total_spend()
  @transactions = Transaction.all()
  erb :"/transactions/index"
end

post '/transactions/' do
  @transactions = Transaction.by_month(params[:month],params[:year])
  @total_by_month = Transaction.total_by_month(params[:month], params[:year])
  erb :"transactions/index"
end

get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
 erb :"transactions/new"
end


post '/transactions/new' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions/all")
end

get "/transactions/:id" do
  @more_details = Transaction.more_details(params[:id])
  @transaction = Transaction.find(params[:id])
  erb :"transactions/show"
end

get '/transactions/:id/edit' do
  @tags = Tag.all
  @merchants = Merchant.all
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
