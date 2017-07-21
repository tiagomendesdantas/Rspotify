#'Get an Artist’s Albums
#'
#'
#'function to get albums from an artist using their ID
#'@param id The Spotify ID for the artist.
#'@param market Optional. An ISO 3166-1 alpha-2 country code. Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.
#'@return 'Get an Artist’s Albums
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export
getAlbums<-function(id,type="album",market="US",token){
  require(dplyr)
  total<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/artists/",id,"/albums?album_type=", type),
                                 httr::config(token = token)))$total
  req<-httr::GET(paste0("https://api.spotify.com/v1/artists/",id,
                        "/albums?offset=0&limit=",total,
                        "&album_type=",type,"&market=",market),
                 httr::config(token = token))
  return(lapply(httr::content(req)$items,
                function(x) data.frame(
                  id = x$id,
                  name = x$name,
                  album_type = x$album_type,
                  available_markets = paste(x$available_markets, collapse = ";"),
                  stringsAsFactors = F)) %>%
           bind_rows())
}


