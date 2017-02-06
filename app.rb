require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative './controllers/merchants_controller'
require_relative './controllers/tags_controller'
require_relative './controllers/transactions_controller'

get '/' do
  @total_spend = Transaction.total_spend()
  erb (:index)
end