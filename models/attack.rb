require_relative( '../db/sql_runner' )
require('pry')

class Attack

  attr_reader( :wizard_id, :codeclanner_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @wizard_id = options['wizard_id'].to_i
    @codeclanner_id = options['codeclanner_id'].to_i
  end

  def save()
    sql =  "INSERT INTO attacks
    (
      wizard_id,
      codeclanner_id
    )
    VALUES ($1, $2)
    RETURNING id"
    values = [@wizard_id, @codeclanner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM attacks"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Attack.new(hash)}
  end

  def codeclanner()
    sql = "SELECT * FROM codeclanners WHERE id = $1"
    values = [@codeclanner_id]
    results = SqlRunner.run(sql, values)
    return Codeclanner.new(results.first)

  end

  def wizard()
    sql = "SELECT * FROM wizards WHERE id = $1"
    values = [@wizard_id]
    results = SqlRunner.run(sql, values)
    return Wizard.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM attacks WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Attack.new(results.first)
  end

  def self.delete_all
    sql = "SELECT FROM attacks"
    SqlRunner.run( sql )
  end

  def delete
    sql = "DELETE FROM attacks WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)

  end
end
