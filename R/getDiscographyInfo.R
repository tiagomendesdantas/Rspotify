#'Get an Artist’s Albums and additional info for each album
#'
#'
#'function to get albums from an artist using their ID and add additional info for each album
#'@param id The Spotify ID for the artist.
#'@param market Optional. An ISO 3166-1 alpha-2 country code. Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.
#'@return 'Get an Artist’s Albums
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export
getDiscographyInfo <- function(id,token){
  artist_info <- getAlbums(id,token=token)
  ids <- artist_info$id
  df <- data.frame()
  for (i in ids){
    info <- getAlbumInfo(i, token=keys)
    df <- rbind(df, info)
  }
  df
}
