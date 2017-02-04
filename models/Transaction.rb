require_relative '../db/sql_runner'

class Transaction
  attr_reader :id, :merchant_id,:tag_id, :transaction_amount, :item_description
  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @transaction_amount = options['transaction_amount'].to_f
    @item_description = options['item_description']
  end

  def save()
    sql = ("INSERT INTO transactions(merchant_id, tag_id, transaction_amount, item_description)
          VALUES (#{@merchant_id}, #{@tag_id}, #{@transaction_amount}, '#{@item_description}')
          RETURNING id;")
    @id = SqlRunner.run(sql)
  end


  def self.all()
    sql = ("SELECT * FROM transactions")
    SqlRunner.run(sql).map { |transaction| Transaction.new(transaction)  }
  end
  
end