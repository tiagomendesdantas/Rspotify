#' Get Spotify catalog information for a single artist
#'
#'
#'Function to get Spotify catalog information for a single artist identified by their unique Spotify ID.
#'@param id The Spotify ID for the artist.
#'@return Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@export
#'@examples \dontrun{
#' ## Example
#'
#'
#'foofighters<-getArtist("7jy3rLJdDQY21OgRLCZ9sD")
#'
#'}
#'
getArtist<-function(id){
  req <- httr::GET(paste0("https://api.spotify.com/v1/artists/",id))
  json1<-httr::content(req)
  dados<-data.frame(id=json1$id,name=json1$name,
                    popularity=json1$popularity,
                    followers=json1$followers$total,
                    genres=paste(json1$genres,collapse =";"))
  return(dados)
}

