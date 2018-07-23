require_relative( '../db/sql_runner' )

class Wizard

  attr_reader( :name, :house, :wand, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @house = options['house']
    @wand = options['wand']
  end

  def save()
    sql = "INSERT INTO wizards
    (
      name,
      house,
      wand
    )
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @house, @wand]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

def codeclanners()
  sql = "SELECT c.* FROM codeclanners c INNER JOIN attacks a ON a.codeclanner_id = c.id
  WHERE a.wizard_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map{ |codeclanner|Codeclanner.new(codeclanner) }
end


  def self.all()
    sql = "SELECT * FROM wizards"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Wizard.new(hash)}
end

def self.find(id)
  sql = "SELECT * FROM wizards
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Wizard.new(results.first)
end

def self.delete_all
  sql = "SELECT FROM wizards"
  SqlRunner.run( sql )
end

end
