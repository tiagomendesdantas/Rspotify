#'Get additional album info
#'
#'
#'function to get additional album info from an artist using their ID
#'@param id The Spotify ID for the artist.
#'@param market Optional. An ISO 3166-1 alpha-2 country code. Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.
#'@return 'Get an Artist’s Albums
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export
getAlbumInfo<-function(id,token){
  req<-httr::GET(paste0("https://api.spotify.com/v1/albums/",id),httr::config(token = token))
  json1<-httr::content(req)
  json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))
  df <- data.frame("id" = json2$id, "artist" = as.character(json2$artists$name),"name" = json2$name, "label" = json2$label, "popularity" = json2$popularity, "release_date" = json2$release_date, "release_date_precision" = json2$release_date_precision, "album_type" = json2$album_type, "track_total" = json2$tracks$total)
  df
}
