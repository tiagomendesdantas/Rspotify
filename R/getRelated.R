#' @title
#'Get Related artists
#'
#'
#'function to get the related artists of an Artist
#'@param artistName Name of the artist (can use name or Spotify ID of the artist)
#'@export

#function to get the related artists
#ps:function allows you use the name

getRelated <-function(artistName, token){
  library(plyr)
  info<-searchArtist(artistName, token = token)
  id<-info$id[1]
  name<-info$display_name[1]

  req <- httr::GET(paste0("https://api.spotify.com/v1/artists/",id,"/related-artists"),httr::config(token = token))
  json1<-httr::content(req)
  M <- lapply(json1$artists, "[",
              c("name", "id", "popularity", "type" ))
  N <- lapply(json1$artists, "[[", "followers")
  N <- lapply(N, "[", "total")

  relatedArtists <- ldply(M, data.frame)
  relatedArtists$followers <- dplyr::ldply(N, data.frame)$total

  return(relatedArtists)
}

