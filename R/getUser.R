#' Get basic info of an User
#'
#'
##'function to get basic info of an user
#'@param user_id user id
#'@param token An OAuth token created with \code{spotifyOAuth}.
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
#'
#function to retrieve information about a user
#information about an user
getUser<-function(user_id,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/users/",user_id), httr::config(token = token))
  json1<-httr::content(req)
  dados=data.frame(display_name=json1$display_name,
                   id=json1$id,
                   followers=json1$followers$total,stringsAsFactors = F)
  return(dados)
}


