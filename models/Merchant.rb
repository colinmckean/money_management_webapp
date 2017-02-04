require_relative '../db/sql_runner'

class Merchant
  def initialize(options)
    attr_reader :id, :merchant_name
    @id = options["id"].to_i
    @merchant_name = options["merchant_name"]
  end

  def save()
    sql = ("INSERT INTO merchants(merchant_name) 
            VALUES ('RALF') 
            RETURNING id;")
    @id = SqlRunner.run(sql)
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
    
  end
end




