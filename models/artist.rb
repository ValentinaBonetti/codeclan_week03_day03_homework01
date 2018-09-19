require("pg")
require_relative("../db/sql_runner")

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @birth_year = options["birth_year"]
  end

  def save
    sql = "INSERT INTO artists (name,birth_year)
           VALUES ($1,$2)
           RETURNING *"
    values = [@name,@birth_year]
    result = SqlRunner.run(sql,values)
    @id = result[0]["id"].to_i 
  end



end
