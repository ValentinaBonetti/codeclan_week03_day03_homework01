require("pry")
require_relative("./models/album")
require_relative("./models/artist")


artist1 = Artist.new({"name" => "Eric Clapton", "birth_year" => 1945})
artist1.save

# @album_name,@year,@duration,@artist_id
album1 = Album.new({
  "album_name" => "No reason to cry",
  "year" => 1976,
  "duration" => "45:59",
  "artist_id" => artist1.id})
album1.save


binding.pry
nil
