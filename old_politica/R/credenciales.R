#Haciendo archivo de credenciales de R - Pollítico

# Instalamos las librerías siguientes:

install.packages("ROAuth");
install.packages("base64enc");
install.packages("twitteR");
install.packages("streamR");

# Cargamos las librerias:

library("ROAuth");
library("base64enc");
library("twitteR");
library("streamR");

# Cargamos parámetros de configuración
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
options(httr_oauth_cache=T)

# Cargamos las credenciales obtenidas del paso anterior
consumer_key <- "dVvRjgNddsOV9o5sS97Dgj6pw"
consumer_secret <- "mDSN1x9p4b1xvWocZeUGJbYvjZ93ZkTjYFPJl1H3S0d3Jp7Hkx"
access_token <- "1094207020109099008-Hf1ol2YKI63uOAeKMmMHbfgE8JLjX8"
access_secret <- "GblXsqF8VjPKFwUFo4suYsrHMcF8IvHflSpv5NA2SWKiu"

# Ejecutamos la autenticación de TwitteR
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# streamR authentication
credentials_file <- "my_oauth.Rdata"
if (file.exists(credentials_file)){
  load(credentials_file)
} else {
  cred <- OAuthFactory$new(consumerKey = consumer_key, consumerSecret =
                             consumer_secret, requestURL = reqURL, accessURL = accessURL, authURL = authURL)
  cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
  save(cred, file = credentials_file)
}

