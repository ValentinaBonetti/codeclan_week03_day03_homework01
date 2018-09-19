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

  def list_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums_pgresult = SqlRunner.run(sql,values)
    return albums_pgresult.map {|album_hash| Album.new(album_hash)}
  end



end
