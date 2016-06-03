#'Get top tracks of an Artist
#'
#'
#'function to get top tracks of an Artist by artist ID and country
#'@param id Artist ID
#'@param country Country of interest
#'@export


#function to get top tracks by artist ID and country
#to find the ID use searchArtist
getTop<-function(id,country){
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/artists/",id,"/top-tracks?country=",country))
  return(req$tracks[,c("id","name","popularity","duration_ms","track_number","available_markets")])
}

