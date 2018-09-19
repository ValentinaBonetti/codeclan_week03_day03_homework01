require('pg')
require_relative('../db/sql_runner')

class Album


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @album_name = options["album_name"]
    @year = options["year"]
    @duration = options["duration"]
    @artist_id = options["artist_id"].to_i
  end


  def save()
    sql = "INSERT INTO albums (
      album_name,
      year,
      duration,
      artist_id
    ) VALUES
      ($1,$2,$3,$4)
      RETURNING *"
      values = [@album_name,@year,@duration,@artist_id]
      result = SqlRunner.run(sql,values)
      @id = result[0]["id"].to_i
    end

  def show_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist_pgresult = SqlRunner.run(sql,values)
    return Artist.new(artist_pgresult[0])
  end

end
