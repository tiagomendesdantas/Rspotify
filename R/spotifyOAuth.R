#' @title
#' Create OAuth token to access Spotify web API
#'
#' @description
#' \code{spotifyOAuth} creates a long-lived OAuth access token that enables R to make
#' authenticated calls to the Spotify API. The token can be saved as a
#' file in disk to be re-used in future sessions. This function relies on the
#' \code{httr} package to create the OAuth token
#'@param app_id App ID (this is an internal identification for token if you wish to save authorization)
#'@param client_id Client ID
#'@param client_secret Client Secret
#' @examples \dontrun{
#' ## Example
#'  my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
#'  save(my_oauth, file="my_oauth")
#'  load("my_oauth")
#'  tiago <- getUser(user_id="t.mendesdantas",token=my_oauth)
#' }
#'
#'
#'@export


spotifyOAuth<-function(app_id,client_id,client_secret){
spotifyR <- httr::oauth_endpoint(
  authorize = "https://accounts.spotify.com/authorize",
  access = "https://accounts.spotify.com/api/token")
#if (packageVersion('httr') > "0.6.1"){Sys.setenv("HTTR_SERVER_PORT" = "1410/")}
myapp <- httr::oauth_app(app_id, client_id, client_secret)
return(httr::oauth2.0_token(spotifyR, myapp,scope = "playlist-read-private"))}

