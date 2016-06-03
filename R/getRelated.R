#'Get Related artists
#'
#'
#'function to get the related artists of an Artist
#'@param artistName Name of the artist (can use name or Spotify ID of the artist)
#'@export
#'
#function to get the related artists
#ps:funtion allows you use the name
getRelated <-function(artistName){
  info<-searchArtist(artistName)
  id<-info$id[1]
  name<-info$name[1]
  relatedArtists<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/artists/",id,"/related-artists"))$artists
  relatedName<-relatedArtists$name
  relatedID<-relatedArtists$id
  followers<-relatedArtists$followers$total
  popularity<-relatedArtists$popularity
  return(data.frame(sourceID=id, sourceName=name, names=relatedName,popularity=popularity,followers=followers, id=relatedID,stringsAsFactors=F))
}
