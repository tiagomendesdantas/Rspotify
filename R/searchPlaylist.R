#'Search for playlists given a name
#'
#'
#'function to search for playlists given a name
#'@param playlistName Name of the playlist being searched for
#'@param offset The index of the first Playlist to return. Default: 0 (the first object). Maximum offset: 100.000.
#'@export


#function to search for playlists given a name
searchPlaylist<-function(playlistName,offset=0){
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/search?q=", gsub(' ', '+', playlistName),"&type=playlist&limit=50&offset=",offset))
  playlist<-req$playlists$items
  playlist.df<-data.frame(playlist[,c("id","name")],tracks=playlist$tracks$total,ownerid=playlist$owner$id,stringsAsFactors = F)
  return(playlist.df)
}
