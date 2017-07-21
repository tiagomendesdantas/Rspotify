#'Get a Track
#'
#'
#'Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@param id The Spotify ID for the track.
#'@return 'Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getTrack<-function(id, token){
  req<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/tracks/",id),
                               httr::config(token = token)))
  return(data.frame(
    id=req$id,
    name=req$name,
    explicit=req$explicit,
    popularity=req$popularity,
    artists = paste(lapply(req$artists, function(x) x$name), collapse = ";"),
    artists_IDs=paste(lapply(req$artists, function(x) x$id), collapse = ";"),
    album=req$album$name,
    albumID=req$album$id))
}

