#' @title
#'Search for a specific Track
#'
#'
#'function to get basic info about a searched Artist
#'@param track Name of the trach
#'@param token An OAuth token created with \code{spotifyOAuth}.
#' @examples \dontrun{
#' ## Example
#' ## my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
#' ## save(my_oauth, file="my_oauth")
#' ## load("my_oauth")
#' ## track <- searchTrack("generator",token=my_oauth)
#' }
#'@export

#function to search for a specifc track
#note that if you don't provide a specifc name the function will return possible cases that match
#sorted by popularity
searchTrack<-function(track,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/search?q=", gsub(' ', '+', track),"&type=track"), httr::config(token = token))
  json1 <- httr::content(req)
  x<-json1$tracks$items
  display_name=unlist(lapply(x,function(x)x$name))
  id=unlist(lapply(x,function(x)x$id))
  popularity<-unlist(lapply(x,function(x)x$popularity))
  artist.pre<-lapply(x,function(x)x$artists)
  artists_IDs <- plyr::ldply(artist.pre, data.frame)$id
  artists <- plyr::ldply(artist.pre, data.frame)$name
  type<-unlist(lapply(x,function(x)x$type))
  dados <- data.frame(display_name, id, popularity,artists,artists_IDs,type, stringsAsFactors = F)
  return(dados[order(-popularity),])
}



