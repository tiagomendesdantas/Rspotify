#' @title
#'Search for an specific Artist
#'
#'
#'function to get basic info about a searched Artist
#'@param artistName Name of the artist
#' @examples \dontrun{
#' ## Example
#' search<-searchArtist("Foo+fighters")
#'
#' }
#'
#'
#'@export

#function to search for a specifc artist
#note that if you don't provide a specifc name the function will return possible cases that match
#sorted by popularity
searchArtist<-function(artistName){
  req<-jsonlite::fromJSON(paste0("https://api.spotify.com/v1/search?q=", gsub(' ', '+', artistName),"&type=artist"))
  artist<-req$artists$items[,c("id","name","popularity","genres","type")]
  artist$followers<-as.numeric(req$artists$items$followers$total)
  return(artist)
}

