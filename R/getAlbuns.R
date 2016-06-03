#'Get an Artist’s Albums
#'
#'
#'function to get albuns from an artist using their ID
#'@param id The Spotify ID for the artist.
#'@param market Optional. An ISO 3166-1 alpha-2 country code. Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.
#'@return 'Get an Artist’s Albums
#'@export
getAlbuns<-function(id,type="album",market="US"){
  total<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/artists/",id,"/albums??&album_type=album"))$total
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/artists/",id,"/albums??offset=0&limit=",total,"&album_type=",type,"&market=",market))
  return(req$items[,c("id","name","album_type","available_markets")])
}


