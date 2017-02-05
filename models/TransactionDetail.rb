require_relative '../db/sql_runner'

class TransactionDetail
  attr_reader :id,:transaction_amount, :merchant_name, 
  :tag_name, :item_description
  def initialize(options)
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
    @tag_name = options['tag_name']
    @transaction_amount = options['transaction_amount'].to_f
    @item_description = options['item_description']
  end
end