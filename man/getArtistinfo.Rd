% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getArtistinfo.R
\name{getArtistinfo}
\alias{getArtistinfo}
\title{Get Spotify catalog information for a single artist}
\usage{
getArtistinfo(id, token)
}
\arguments{
\item{id}{The Spotify ID for the artist.}

\item{token}{An OAuth token created with \code{spotifyOAuth}.}
}
\value{
Get Spotify catalog information for a single track identified by its unique Spotify ID.
}
\description{
Function to get Spotify catalog information for a single artist identified by their unique Spotify ID.
}
\examples{
\dontrun{
## Example


foofighters<-getArtist("7jy3rLJdDQY21OgRLCZ9sD")

}
}
