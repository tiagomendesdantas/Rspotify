#'Get an Album’s Tracks
#'
#'
#'Get Spotify catalog information about an album’s tracks.
#'@param id The Spotify ID for the album.
#'@return get Album from an artist using their ID
#'@export

getAlbum<-function(id){
req<-httr::GET(paste0("https://api.spotify.com/v1/albums/",id,"/tracks"))
json1<-httr::content(req)
json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
return(json2[,c("id","name","duration_ms","track_number","disc_number","available_markets","preview_url")])
}


