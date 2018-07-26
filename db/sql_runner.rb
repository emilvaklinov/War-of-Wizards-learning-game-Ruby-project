require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'wizards', host: 'localhost' })
      db = PG.connect({ dbname: 'd4ma9lg1jqt36f', host: 'ec2-54-235-177-183.compute-1.amazonaws.com' port: 5432, user: 'ntctyxzzyadiqb', password: 'b9596a5b06784621ff5383565a5a98819844f7d9dac92bb43c26894bc2a5d3c3'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
