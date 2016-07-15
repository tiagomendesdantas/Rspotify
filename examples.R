
"spotifystats2u", "c6785c3edf234c83935a315a149e7290", "01cf20a53fad4556a90031739aff044e"


library(Rspotify)
library(httr)
library(jsonlite)

token<-spotifyOAuth("spotifystats2u","c6785c3edf234c83935a315a149e7290","01cf20a53fad4556a90031739aff044e")

#information about a user
tiago<-getUser("t.mendesdantas",token=token)

#search for an artist
foofighters<-searchArtist("foo+fighters")

#get more information about this artist (popularity and genres)
#foo_profile<-getArtist("7jy3rLJdDQY21OgRLCZ9sD")
#FOR SOME WEIRD REASON MY CHANGES ARE NOT BEING INCORPORATED getArtist suppose
# to be like the one bellow but it keeps maintaining as a Previous  version
# Do you have a clue on why is that happening?

getArtist<-function(id){
  req <- httr::GET(paste0("https://api.spotify.com/v1/artists/",id))
  json1<-httr::content(req)
  dados<-data.frame(id=json1$id,name=json1$name,
                    popularity=json1$popularity,
                    followers=json1$followers$total,
                    genres=paste(json1$genres,collapse =";"))
  return(dados)
}




#create a network of related artists
foo<-getRelated("foo+fighters")
for (i in 1:200){
  if(foo$name[i] %in% foo$sourceName){next}
  else{
    a<-try(getRelated(foo$name[i]))
    if ('try-error' %in% class(a)) next
    foo<-rbind(foo,a)}
  print(i)
}

