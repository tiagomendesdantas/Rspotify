#'Get a Track
#'
#'
#'Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@param id The Spotify ID for the track.
#'@return 'Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@export

getArtist<-function(id){
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/tracks/",id))
  return(data.frame(id=req$id,name=req$name,explicit=req$explicit,popularity=req$popularity,artist=req$artists$name,artistID=req$artists$id,album=req$album$name,albumID=req$album$id))
}

