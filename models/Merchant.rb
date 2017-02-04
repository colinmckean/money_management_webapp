require_relative '../db/sql_runner'

class Merchant
  attr_reader :id, :merchant_name
  def initialize(options)
    @id = options["id"].to_i
    @merchant_name = options["merchant_name"]
  end

  def save()
    sql = ("INSERT INTO merchants(merchant_name) 
            VALUES ('#{@merchant_name}') 
            RETURNING id;")
    @id = SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id=#{id}"
        SqlRunner.run( sql )
  end

  def self.update(options)
    sql = ("UPDATE merchants SET
      merchant_name='#{options['merchant_name']}'
      WHERE id='#{options['id']}'")
    SqlRunner.run(sql)
  end


  def self.all()
    sql = ("SELECT * 
            FROM merchants;")
    SqlRunner.run(sql).map{|merchant| Merchant.new(merchant)}
  end
  def self.find(id)
    sql = ("SELECT *
            FROM merchants
            WHERE id = '#{id}';")
    Merchant.new(SqlRunner.run(sql)[0])
  end
end




