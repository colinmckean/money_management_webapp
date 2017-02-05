require_relative '../db/sql_runner'
require_relative './TransactionDetail'

class Transaction
  attr_reader :id,:merchant_id, :tag_id, :transaction_amount, :item_description
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

  def self.find(id)
    sql = ("SELECT * FROM transactions
      WHERE id = '#{id}'")
    Transaction.new(SqlRunner.run(sql)[0])
  end

  def self.update(options)
    sql = ("UPDATE transactions SET
      merchant_id='#{options['merchant_id']}',
      tag_id='#{options['tag_id']}',
      transaction_amount='#{options['transaction_amount']}',
      item_description='#{options['item_description']}'
      WHERE id='#{options['id']}'")
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions
           WHERE id = #{id}"
            SqlRunner.run(sql)
  end

  def self.total_spend
    sql = ("SELECT
           SUM(transaction_amount) 
           FROM transactions;")
    SqlRunner.run(sql)[0]["sum"].to_f
  end

  def self.more_details(id)
    sql = "SELECT trans.id, trans.transaction_amount, trans.item_description, m.merchant_name, t.tag_name
    FROM transactions trans
    INNER JOIN merchants m
    ON m.id = trans.merchant_id
    INNER JOIN tags t
    ON t.id = trans.tag_id
    WHERE trans.id ='#{id}'";
    TransactionDetail.new(SqlRunner.run(sql)[0])
  end
end