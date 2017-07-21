#'Get top tracks of an Artist
#'
#'
#'function to get top tracks of an Artist by artist ID and country
#'@param id Artist ID
#'@param country Country of interest
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

#function to get top tracks by artist ID and country
#to find the ID use searchArtist
getTop<-function(id, country, token){
  require(dplyr)
  req<-httr::content(httr::GET(
    paste0("https://api.spotify.com/v1/artists/",id,
           "/top-tracks?country=",country),
    httr::config(token = token)))
  return(
    dplyr::bind_rows(
      lapply(req$tracks, function(x)
      data.frame(id = x$id, name = x$name, popularity = x$popularity,
               duration_ms = x$duration_ms, track_number = x$track_number,
               available_markets = paste(x$available_markets, collapse = ";"),
               stringsAsFactors = F))))
}

