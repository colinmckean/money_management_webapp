require_relative '../db/sql_runner'
class Tag
  attr_reader :id, :tag_name
  def initialize(options)
    @id = options['id'].to_i
    @tag_name = options['tag_name']
  end

  def save()
    sql = ("INSERT INTO tags(tag_name)
            VALUES ('#{@tag_name}')
            RETURNING id;")
    @id = SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id=#{id}"
        SqlRunner.run( sql )
  end

  def self.all()
    sql = ("SELECT * FROM tags;")
    SqlRunner.run(sql).map {|tag|Tag.new(tag)}
  end

  def self.find(id)
    sql = ("SELECT * FROM tags
            WHERE id = '#{id}';")
    Tag.new(SqlRunner.run(sql)[0])
  end
end