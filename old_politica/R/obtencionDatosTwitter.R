#Utilizando el archivo de credenciales.R, obtenemos los datos de Twitter - Pollitico

# Cargamos la librería específica de TwitterR
library(twitteR);

# Leemos el fichero de credenciales creado anteriormente, ¡cuidado con la ruta del fichero!.
source('credenciales.R')

# Con esta función buscamos en Twitter: #hastag, @usuarios, palabras
tweets <- searchTwitter("politica", n=10, lang="es")

# Nos quedamos solo con el primer tweet
tweet <- tweets[[1]];

# Mostramos toda la estructura del tweet
str(tweet)

# Obtenemos el texto del tweet:
tweet$getText()

# Obtenemos toda la información del usuario:
usuario <- getUser(tweet$getScreenName());

# Mostramos toda la estructura del usuario
str(usuario)

# Obtenemos el nombre del usuario
usuario$getName()