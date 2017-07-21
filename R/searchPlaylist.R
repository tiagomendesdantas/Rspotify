#'Search for playlists given a name
#'
#'
#'function to search for playlists given a name
#'@param playlistName Name of the playlist being searched for
#'@param offset The index of the first Playlist to return. Default: 0 (the first object). Maximum offset: 100.000.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export


#function to search for playlists given a name
searchPlaylist<-function(playlistName,offset=0, token = token){
  #require(dplyr)
  req<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/search?q=",
                                      gsub(" ", "+", playlistName),
                                      "&type=playlist&limit=50&offset=",offset),
                               httr::config(token = token)))
  playlist<-req$playlists$items
  playlist.df<- dplyr::bind_rows(
    lapply(playlist, function(x) data.frame(
      id = x$id, name = x$name, tracks = x$tracks$total,
      owner = x$owner$id, stringsAsFactors = FALSE)))
  return(playlist.df)
}
