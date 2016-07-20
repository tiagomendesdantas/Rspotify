#'Get the songs of an specific playlist
#'
#'
#'function to get songs about a specifc playlist
#'@param ownerid Owner ID
#'@param playlistid Playlist ID
#'@param offset The index of the first songs to return. Default: 0 (the first object). Maximum offset: 100.000.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

#function to get playlists' songs
getPlaylistSongs<-function(ownerid,playlistid,offset=0,token){
  req<-httr::GET(paste0("https://api.spotify.com/v1/users/",ownerid,"/playlists/",playlistid,"/tracks?&limit=100&offset=",offset),httr::config(token = token))
  json1<-httr::content(req)
  json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
  tracks<-unlist(json2$track$name)
  popularity<-unlist(json2$track$popularity)
  id<-unlist(json2$track$id)
  artist<-unlist(lapply(seq(1:length(tracks)), function (x){return(data.frame(json2$track$artists[x])$name[1])}))
  album<-unlist(json2$track$album$name)
  playlistSongs<-data.frame(tracks,id,popularity,artist,album,stringsAsFactors = F)
  return(playlistSongs)
}
