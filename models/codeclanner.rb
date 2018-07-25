require_relative( '../db/sql_runner' )
# require('pry')

class Codeclanner

  attr_reader( :name, :cohort, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cohort = options['cohort']
  end

  def save()
    sql = "INSERT INTO codeclanners
    (
      name,
      cohort
    )
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @cohort]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# ADD new codeclanner
  def new()
    sql = "INSERT INTO codeclanners ( name, cohort )
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @cohort]
    SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def wizards
    sql = "SELECT w.* FROM wizards w INNER JOIN attacks a ON a.wizard_id = w.id
    WHERE a.codeclanner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |wizard|Wizard.new(wizard) }
  end

  def self.all()
    sql = "SELECT * FROM codeclanners"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Codeclanner.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM codeclanners WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Codeclanner.new(results.first)
  end

  def self.delete_all
    sql = "SELECT FROM codeclanners"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM codeclanners WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end


end
