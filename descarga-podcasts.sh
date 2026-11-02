#!/bin/bash

# La programación de descarga de podcast necesita que se definan 3 variables
# En primer lugar la direccón del RSS del Podcast en PODCAST_RSS_URL.
# En segundo lugar la dirección en el sistema de archivos donde se quiere grabar el archivo en FICHERO_DESTINO
# En tercer lugar en DURACION _MINIMA la duración mínima del programa en formato hhmmss se pueden omitir valores a la izquierda cuando
# son ceros. Por ejemplo si como mínimo queremos programas de 1h30m pondremos 13000. Si necesitamos uno de 10m 
# usaremos 1000, más de 50minutos sería 5000. Si indicamos un "0" descargará siempre el último podcast.
#
# Luego simplemente deberíamos ejecutar la línea de descargar los podcasts.
#
#  /home/cuacfm/bin/descarga-primer-podcast-programa.sh "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA" "$FILTRO"

DESCARGADOR_PRIMER_PODCAST="/home/cuacfm/bin/descarga-podcasts/descarga-primer-podcast-programa.sh"

#DESCARGA DE CARNE CRUDA
# 2026-09-15: iVoox deixou de sindicar este filtro (último episodio 04-ago,
# aínda que a web segue publicando). Feed oficial do editor en Acast.
PODCAST_RSS_URL="https://feeds.acast.com/public/shows/carne-cruda-programas"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Carne-Cruda/carnecruda.mp3"
DURACION_MINIMA="5000"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE RADIO CERNA
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-radio-cerna_fg_f18577_filtro_1.xml"
#PODCAST_RSS_USL_NO_FUNCIONA="http://adega.gal/web/radiocerna/podcast.php?idioma=gl"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Radio-Cerna/radio-cerna.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE DEMOCRACY NOW BLOG RESUMEN SEMANAL
PODCAST_RSS_URL="https://audio.urcm.net/spip.php?page=backend&id_rubrique=64"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Democracy-Now-Blog/democracy-now-blog.mp3"
DURACION_MINIMA="0"
#FILTRO="resumen_semanal"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA" "$FILTRO"

##DESCARGA DE DEMOCRACY NOW COLUMNA AMMY (NO FUNCIONA)
#PODCAST_RSS_URL="http://www.democracynow.org/es/democracynow-blog.rss"
#FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Democracy-Now-Columna-Amy/democracy-now-columna-amy.mp3"
#DURACION_MINIMA="0"
#FILTRO="amycolumn"
#$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA" "$FILTRO"
#unset FILTRO

#DESCARGA DE DEMOCRACY NOW DIARIO
PODCAST_RSS_URL="https://www.democracynow.org/podcast-emisoras.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Democracy-Now-Diario/democracy-now-diario.mp3"
DURACION_MINIMA="0"

$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA AMNISTIA INTERNACIONAL - LO USA ONDA COLOR TAMBIEN
PODCAST_RSS_URL="https://audio.urcm.net/spip.php?page=backend&id_rubrique=1"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Amnistia-Internacional/amnistia-internacional.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ABRETE DE ORELLAS
PODCAST_RSS_URL="https://www.ivoox.com/abrete-orellas_fg_f186732_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Abrete-De-Orellas/abrete-de-orellas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE PROXECTO NEO ENTREVISTAS
#PODCAST_RSS_URL="http://www.ivoox.com/podcast-entrevistas_fg_f1273438_filtro_1.xml"
#FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Proxecto-Neo-Entrevistas/proxecto-neo-entrevistas.mp3"
#DURACION_MINIMA="0"
#$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DATE_NEO_ENTREVISTAS=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`

#DESCARGA DE PROXECTO NEO
PODCAST_RSS_URL="https://www.ivoox.com/podcast-proxecto-neo_fg_f1131749_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Proxecto-Neo/proxecto-neo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


# Código para permitir que se machque el podcast de proyecto neo si en el de entrevistas tienen una nueva
#DATE_NEO=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`

#if [[ "$DATE_NEO" < "$DATE_NEO_ENTREVISTAS" ]]
#  then
#      echo "Subtituyendo Proyecto NEO Entrevista por Proyecto NEO al ser la entrevista más moderna"
#      cp /home/cuacfm/ownCloud/Podcast/Programas-Externos/Proxecto-Neo-Entrevistas/proxecto-neo-entrevistas.mp3 $FICHERO_DESTINO
#fi

#DESCARGA DE LA RADIO DE LOS GATOS - ASPACE
PODCAST_RSS_URL="https://www.ivoox.com/radio-gatos-aspace_fg_f1458835_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/La-Radio-De-Los-Gatos/la-radio-de-los-gatos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE MAR DE FUEGUITOS
PODCAST_RSS_URL="https://www.ivoox.com/programas-mar-fueguitos_fg_f1141927_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Mar-de-Fueguitos/mar-de-fueguitos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE LA CAFETERA RADIOCABLE
PODCAST_RSS_URL="https://www.spreaker.com/user/5647623/episodes/feed"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Cafetera-RadioCable/cafetera-radiocable.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE GRANDES VOCES DO NOSO MUNDO
PODCAST_RSS_URL="https://www.ivoox.com/grandes-voces-do-noso-mundo_fg_f1139260_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Grandes-Voces-Do-Noso-Mundo/grandes-voces-do-noso-mundo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE HIGH STREET
PODCAST_RSS_URL="https://www.ivoox.com/podcast-higher-street-radiofusion_fg_f1795901_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Higher-Street/higher-street.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA LOS MEDIATIZADOS
PODCAST_RSS_URL="https://anchor.fm/s/2396eb50/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Los-Mediatizados/los-mediatizados.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DESCIFRANDO A HISTORIA
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f11062871_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Descifrando-a-historia/descifrando-a-historia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA GALIPORTUS
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f12050026_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Galiportus/galiportus.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA NOTICIAS DE A CORUÑA
PODCAST_RSS_URL="https://anchor.fm/s/e7855790/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Noticias-De-A-Coruña/noticias-de-coruña.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA SABADOS NO CRUCEIRO
PODCAST_RSS_URL="https://feeds.ivoox.com/feed_fg_f11084822_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Sabados-No-Cruceiro/sabados-no-cruceiro.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA INFORMATIVO SAHARAUI
PODCAST_RSS_URL="https://feeds.ivoox.com/feed_fg_f13212038_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Informativo-Saharaui/informativo-saharaui.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RECUNCHO GAMER PODCAST
PODCAST_RSS_URL="https://feeds.ivoox.com/feed_fg_f11092284_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Recuncho-Gamer-Podcast/recuncho-gamer-podcast.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


# REDIFUSIONES PROGRAMAS INTERNOS

#DESCARGA DE ORION
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/orion-21/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Orion/orion-21.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA TAPAS Y RACIONES
#PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/tapas-y-raciones/rss/"
#FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Tapas-Y-Raciones/tapas-y-raciones.mp3"
#DURACION_MINIMA="0"
#$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA MULTIPLEX
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/multiplex/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Multiplex/multiplex.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA LA JUVENTUD DEL PAPA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/la-juventud-del-papa/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Juventud-Del-Papa/juventud-papa.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RADIOACTIVA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radioactiva/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radioactiva/radioactiva.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA CAFE CON GOTAS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/cafe-con-gotas/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Cafe-Con-Gotas/cafe-con-gotas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA CIRCO PIRATA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/circo-pirata/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Circo-Pirata/circo-pirata.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ALEGRIA 
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/alegria/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Alegria/alegria.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DESINFORMATIVO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/el-desinformativo/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Desinformativo/el-desinformativo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA SIMPLEMENTE GENTE
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/simplemente-gente/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Simplemente-Gente/simplemente-gente.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA A FUME DE CAROZO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/a-fume-de-carozo/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/A-Fume-De-Carozo/a-fume-de-carozo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RECENDO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/recendo/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Recendo/recendo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA SPOILER
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/spoiler/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Spoiler/spoiler.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA MI ROLLO ES EL ROCK
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/mi-rollo-es-el-rock/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Mi-Rollo-Es-El-Rock/mi-rollo-es-el-rock.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA XERACION BRAVU
#PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/xeracion-bravu/rss/"
#FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Xeracion-Bravu/xeracion-bravu.mp3"
#DURACION_MINIMA="0"
#$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ENWORKING
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/enworking/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Enworking/enworking.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el ultimo enworking al comun de enworking-tasebemnaradio
ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/Enworking-Tase-Bem/enworking-tase-bem.mp3"
if [ ! -f $FICHERO_COMUN ]
then
    echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
    DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
    if [ ! -d $DIRECTORIO_COMUN ]
    then
	mkdir -p $DIRECTORIO_COMUN
    fi
    cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
fi

ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
  then
      echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
      cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
fi

#DESCARGA Tase Bem Na Radio
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/ta-se-bem-na-radio/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Tase-Bem-Na-Radio/ta-se-bem-na-radio.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el ultimo Tase Ben Na Radio al comun de enworking-tasebemnaradio
ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/Enworking-Tase-Bem/enworking-tase-bem.mp3"
if [ ! -f $FICHERO_COMUN ]
then
    echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
    DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
    if [ ! -d $DIRECTORIO_COMUN ]
    then
	mkdir -p $DIRECTORIO_COMUN
    fi
    cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
fi

ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
  then
      echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
      cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
fi

#DESCARGA HEIMA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/heima/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Heima/heima.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA NUBES DE PAPEL
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/nubes-de-papel/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Nubes-De-Papel/nubes-de-papel.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA CUAK'N'ROLL
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/cuaknroll/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Cuaknroll/cuaknroll.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RADIOSENIOR
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radiosenior/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radiosenior/radiosenior.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ESPECIAL FESTIVAL NOROESTE ESTRELLA GALICIA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/especial-festival-noroeste-estrella-galicia/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Especial-Festival-Noroeste-Estrella-Galicia/especial-festival-noroeste-estrella-galicia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ESCAPEMOTOR
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/escapemotor/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Escapemotor/escapemotor.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA POCA BROMA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/poca-broma/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Poca-Broma/poca-broma.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA MALHUMORHADAS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/malhumorhadas/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Malhumorhadas/malhumorhadas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA TURBULENCIAS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/turbulencias/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Turbulencias/turbulencias.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA Escuela de Familias
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/escuela-de-familias/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Escuela-De-Familias/escuela-de-familias.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DJ Gaby Oro
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/dj-gaby-oro/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Dj-Gaby-Oro/dj-gaby-oro.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA La Ciencia es Femenino
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/la-ciencia-es-femenino/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Ciencia-es-Femenino/la-ciencia-es-femenino.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el La-Ciencia-Es-Femenino al comun de la-ciencia-es-femenino-radio-parafuso
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Ciencia-Es-Femenino-Parafuso/la-ciencia-es-femenino-radio-parafuso.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi

#DESCARGA Bipolares
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/bipolares/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Bipolares/bipolares.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA Peneirando a educacion
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/peneirando-educacion/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Peneirando-A-Educacion/peneirando-educacion.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA Minority Sports
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/minority-sports/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Minority-Sports/minority-sports.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA Radio 50 Y Pico
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radio-50-y-pico/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radio-50-Y-Pico/radio-50-y-pico.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE FANZINE RADIO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/fanzine-radio/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Fanzine-Radio/fanzineradio.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE VELLENIALS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/vellenials/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Vellenials/vellenials.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ¿CONOCES HANNOVER?
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/conoces-hannover/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Conoces-Hannover/conoces-hannover.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE OPINIONES EN TXURI URDIN
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/opiniones-en-txuri-urdin/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Opiniones-En-Txuri-Urdin/opiniones-en-txuri-urdin.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA OZA-GAITEIRA-OS CASTROS: BARRIOS 2030
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/oza-gaiteira-os-castros-barrios-2030/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Oza-Gaiteira-Os-Castros-Barrios-2030/oza-gaiteira-os-castros-barrios-2030.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA CRUNIA FALA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/crunia-fala/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Crunia-Fala/crunia-fala.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA MUSIC BOX
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/music-box/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Music-Box/music-box.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE LOS ADOQUINES A LOS ALPES
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/de-los-adoquines-los-alpes/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/De-Los-Adoquines-A-Los-Alpes/de-los-adoquines-a-los-alpes.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ONDA CIENCIA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/onda-ciencia/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Onda-Ciencia/onda-ciencia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA Y SI NOS ECHAMOS UNOS GUAROS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/y-si-nos-echamos-unos-guaros/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Y-si-nos-echamos-unos-guaros/unos-guaros.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DRAGONFLY
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/dragonfly/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Dragonfly/dragonfly.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE LA NOVENA PUERTA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/la-novena-puerta/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Novena-Puerta/la-novena-puerta.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ECUACION
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/ecuacion/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Ecuacion/ecuacion.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque comun de ecuacion-radio-ceus
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/Ecuacion-Radio-Ceus/ecuacion-radio-ceus.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi

#DESCARGA VELAI VAI
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/velai-vai/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Velai-Vai/velai-vai.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA FRECUENCIA ELECTRÓNICA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/frecuencia-electronica/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Frecuencia-Electronica/frecuencia-electronica.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA LLAMANDO A LA TIERRA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/llamando-a-la-tierra/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Llamando-A-La-Tierra/llamando-a-la-tierra.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RADIO PARAFUSO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radio-parafuso/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radio-Parafuso/radioparafuso.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el Radio Parafuso al comun de la-ciencia-es-femenino-radio-parafuso
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Ciencia-Es-Femenino-Parafuso/la-ciencia-es-femenino-radio-parafuso.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi

#DESCARGA ESTRELADOS NA ESTRATOSFERA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/estrelados-na-estratosfera/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Estrelados-Na-Estratosfera/estrelados-na-estratosfera.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA PUT THE BRAKE MR. CUPCAKE
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/put-brake-mr-cupcake/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Put-The-Brake-Mr-Cupcake/put-brake-mr-cupcake.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RADIO CEUS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radio-ceus/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radio-Ceus/radio-ceus.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque comun de ecuacion-radio-ceus
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/Ecuacion-Radio-Ceus/ecuacion-radio-ceus.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi


#DESCARGA ACROBACIAS SOBRE UN QUESO RANCIO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/acrobacias-sobre-un-queso-rancio/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Acrobacias-Sobre-Un-Queso-Rancio/acrobacias-sobre-un-queso-rancio.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ANÁTIDAS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/anatidas/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Anatidas/anatidas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA EL MALINFORMADO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/el-malinformado/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Malinformado/el-malinformado.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el El Malinformado al comun de el-malinformado-la-taberna-de-la-verdad
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Malinformado-La-Taberna-De-La-Verdad/el-malinformado-la-taberna-de-la-verdad.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi

#DESCARGA 2D6
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/2d6/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/2d6/2d6.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA RADIO RELATOS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radio-relatos/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radio-Relatos/radio-relatos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA TINTA Y VOZ
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/tinta-y-voz/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Tinta-y-voz/tinta-y-voz.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA LA TABERNA DE LA VERDAD
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/la-taberna-de-la-verdad/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/La-Taberna-De-La-Verdad/la-taberna-de-la-verdad.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#Bloque para copiar el la-taberna-de-la-verdad al comun de el-malinformado-la-taberna-de-la-verdad
if [ -f $FICHERO_DESTINO ]
then
    ULTIMA_FECHA_DESCARGA_PODCAST=`date +%Y-%m-%d-%H:%M -r "$FICHERO_DESTINO"`
    FICHERO_COMUN="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Malinformado-La-Taberna-De-La-Verdad/el-malinformado-la-taberna-de-la-verdad.mp3"
    if [ ! -f $FICHERO_COMUN ]
    then
	echo "Creando $FICHERO_COMUN con $FICHERO_DESTINO"
	DIRECTORIO_COMUN=$(dirname "${FICHERO_COMUN}")
	if [ ! -d $DIRECTORIO_COMUN ]
	then
	    mkdir -p $DIRECTORIO_COMUN
	fi
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi

    ULTIMA_FECHA_FICHERO_COMUN=`date +%Y-%m-%d-%H:%M -r "$FICHERO_COMUN"`
    if [[ "$ULTIMA_FECHA_FICHERO_COMUN" < "$ULTIMA_FECHA_DESCARGA_PODCAST" ]]
    then
	echo "Subtituyendo $FICHERO_COMUN con $FICHERO_DESTINO"
	cp -a "$FICHERO_DESTINO" "$FICHERO_COMUN"
    fi
fi

#DESCARGA RADIO EN RUTA
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/radio-en-ruta/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Radio-En-Ruta/radio-en-ruta.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA EL ORADOR
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/el-orador/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Orador/el-orador.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DESDE 1M MÁS ABAJO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/desde-1m-mas-abajo/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Desde-1m-Mas-Abajo/desde-1m-mas-abajo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA TRECÉPOLIS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/trecepolis/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Trecepolis/trecepolis.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA SUEÑOS DIABÓLICOS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/suenos-diabolicos/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Suenos-Diabolicos/suenos-diabolicos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA EL KIOSKO DE LA RADIO
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/el-kiosko-de-la-radio/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/El-Kiosko-De-La-Radio/el-kiosko-de-la-radio.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA SAFICONAS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/saficonas/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Saficonas/saficonas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA LATIDO JAIME
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/latido-jaime/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Latido-Jaime/latido-jaime.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ARTÉXTASIS
PODCAST_RSS_URL="https://cuacfm.org/radioco/programmes/artextasis/rss/"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/CUACFM/Artextasis/artextasis.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#PETICIONES PODCAST ONDA COLOR
# DESCARGA SANGRE FUCSIA PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-sangre-fucsia_fg_f162460_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Agora-Sol/Sangre-Fucsia/sangre-fucsia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA SIETE PULGADAS PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-7-pulgadas-reggae-radio_fg_f198949_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Siete-Pulgadas/siete-pulgadas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA NOSOTRAS LAS PERSONAS PARA ONDACOLOR
PODCAST_RSS_URL="https://audio.urcm.net/spip.php?page=backend&id_rubrique=121"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Radio-Pimienta/Nosotras-Las-Personas/nosotras-las-personas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA LETRAS Y NOTAS PARA ONDACOLOR REPETIDO
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-letras-notas_fg_f172378_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Radio-Circulo/Letras-Y-Notas/letras-y-notas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE CARNE CRUDA ONDACOLOR
# 2026-09-15: iVoox deixou de sindicar este filtro (último episodio 04-ago,
# aínda que a web segue publicando). Feed oficial do editor en Acast.
PODCAST_RSS_URL="https://feeds.acast.com/public/shows/carne-cruda-programas"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Carne-Cruda/carnecruda.mp3"
DURACION_MINIMA="5000"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#DESCARGA RED REFUGIO ONDA COLOR
# 2026-09-15: o filtro f1585844 desapareceu de iVoox (404 no XML e na páxina).
# O podcast segue aí con outro id: f11049926 (feed declarado pola propia
# páxina https://www.ivoox.com/podcast-red-refugio_sq_f11049926_1.html).
PODCAST_RSS_URL="https://feeds.ivoox.com/feed_fg_f11049926_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Red-Refugio/red-refugio.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA ISTOPIA HISTORIA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-istopia-historia_fg_f1402999_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Istopia-Historia/istopia-historia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA LETRAS Y NOTAS PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-letras-notas_fg_f172378_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Letras-Y-Notas/letras-y-notas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA ECONOMIA PARA LA CIUDADANIA PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-economia-para-ciudadania_fg_f17512_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Economia-Para-Ciudadania/economia-para-ciudadania.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA FULL FRAME PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-full-frame_fg_f1494241_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Full-Frame/full-frame.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA LOS CAMINOS DEL CANTE PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-los-caminos-del-cante_fg_f12784_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Los-Caminos-Del-Cante/caminos-cante.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA SURTOPIAS PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-surtopias-1_fg_f186888_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Surtopias/surtopias.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

# DESCARGA SINTONIA LAICA PARA ONDACOLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-sintonia-laica_fg_f131932_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Sintonia-Laica/sintonia-laica.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA AMNISTIA INTERNACIONAL PARA ONDA COLOR
PODCAST_RSS_URL="https://audio.urcm.net/spip.php?page=backend&id_rubrique=1"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Amnistia-Internacional/amnistia-internacional.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE DEMOCRACY NOW BLOG RESUMEN SEMANAL PARA ONDA COLOR
PODCAST_RSS_URL="https://audio.urcm.net/spip.php?page=backend&id_rubrique=64"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Democracy-Now-Blog/democracy-now-blog.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA" 

#DESCARGA DE MAS VOCES ENTIENDE PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-mas-voces-entiende_fg_f11980_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Mas-Voces-Entiende/mas-voces-entiende.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE OSA PERDIDA PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-osa-perdida_fg_f1617150_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Osa-Perdida/osa-perdida.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE AL CARAJO INFORMATIVO PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-al-carajo_fg_f1127118_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Al-Carajo-Informativo/al-carajo-informativo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE LA VOZ DE LA VIDA PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-voz-vida_fg_f1494459_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/La-Voz-De-La-Vida/la-voz-de-la-vida.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE INFORMATIVO DE LAS RADIOS UNIVERSITARIAS PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-informativo-aru_fg_f1273378_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Informativo-Radios-Universitarias/informativo-radios-universitarias.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ARBOL DE LA VIDA PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-arbol-de-la-vida_fg_f1264248_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Arbol-De-La-Vida/arbol-de-la-vida.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE FILOSOFIA ONDA PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-filosofia-onda_fg_f1149597_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Filosofia-Onda/filosofia-onda.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE UJA Coopera PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-uja-coopera_fg_f11091080_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/UJA-Coopera/uja-coopera.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE PALMA Y ROMEROS PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/podcast-podcast-podcast-palma-romeros_fg_f17623_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Palma-Y-Romeros/palma-y-romeros.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ENTRE LETRAS PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f12575072_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Entre-Letras/entre-letras.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#DESCARGA DE THE GREEN BEE PARA ONDA COLOR
PODCAST_RSS_URL="https://anchor.fm/s/d95804ec/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Green-Bee/green-bee.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#DESCARGA DE EL CANTO DE LA TRIPULACION PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f12394361_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/El-Canto-De-La-Tripulacion/el-canto-de-la-triputacion.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ESCUCHA INQUILINA (Sindicato de Inquilinas de Malaga) PARA ONDA COLOR
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f13187978_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Escucha-Inquilina/escucha-inquilina.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA PROGRAMAS EXTERNOS RADIO KRAS - GIJON

#SANGRE FUCSIA PARA KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-sangre-fucsia_fg_f162460_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Sangre-Fucsia/sangre-fucsia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#INICIATIVA POL ASTURIANO - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-alderiques_fg_f197956_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Iniciativa-Pol-Asturiano/iniciativa-pol-asturiano.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#ENS MOVEM - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-ens-movem_fg_f1699991_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Ens-Movem/ens-movem.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#FAT SOUNDS - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-fat-sounds-sonidos-gordos-reggae_fg_f132194_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Fat-Sounds/fat-sounds.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#AIRES CELTAS - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-aires-celtas_fg_f11098750_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Aires-Celtas/aires-celtas.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#POST APOCALIPSIS NAU - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-post-apocalipsis-nau_fg_f1634081_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Apocalipsis-Nau/apocalipsis-nau.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#BARRIO CANINO - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-barrio-canino_fg_f147957_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Barrio-Canino/barrio-canino.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#MAR DE FUEGUITOS - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-programas-mar-fueguitos_fg_f1141927_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Mar-De-Fueguitos/mar-de-fueguitos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#SAHARA DESDE CANARIAS - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-sahara-desde-canarias_fg_f19823_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Sahara-Desde-Canarias/sahara-desde-canarias.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"


#VERICUETOS - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-vericuetos_fg_f1790043_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Vericuetos/vericuetos.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#CINEFAGIA FM - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/podcast-cinefagia-fm_fg_f1127454_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Cinefagia-FM/cinefagia-fm.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#WOMEN RIOT - PARA RADIO KRAS
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f12743469_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Women-Riot/women-riot.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#ALDERIQUES TWITCH EN VIDEU - PARA RADIO KRAS
# Feed RSS do programa en Spotify for Creators (o audio é MP3 aínda que en Spotify sexa vídeo)
PODCAST_RSS_URL="https://anchor.fm/s/10619a9f4/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/RADIO-KRAS/Alderiques-Twitch/alderiques-twitch.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"
 

#DESCARGA DE PROGRAMAS EXTERNOS PARA CUAC - TEMPORADA 2021/2022

#DESCARGA DE LA LUNA SALE A TIEMPO
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f111771_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/La-Luna-Sale-A-Tiempo/lunasaleatiempo.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE A RUMBOIA
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f1631121_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Rumboia/rumboia.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE FAT SOUNDS
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f132194_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Fat-Sounds/fatsounds.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE COFFEE BREAK
# Feed migrado 2026-03: el show-id viejo (63910e8796d1480011f2eaaa) quedou conxelado
# en ep550. O feed activo e por slug. As partes A/B agora distinguense so no titulo
# (EpNNN_A: / EpNNN_B:), non na URL do enclosure (todas .../media.mp3) -> filtro _A: / _B:
PODCAST_RSS_URL="https://feeds.acast.com/public/shows/coffee-break-senal-y-ruido"
FICHERO_DESTINO_A="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Coffee-Break-A/coffeebreak-a.mp3"
DURACION_MINIMA="0"
FILTRO="_A:"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO_A" "$DURACION_MINIMA" "$FILTRO"
FICHERO_DESTINO_B="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Coffee-Break-B/coffeebreak-b.mp3"
DURACION_MINIMA="0"
FILTRO="_B:"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO_B" "$DURACION_MINIMA" "$FILTRO"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Coffee-Break/coffeebreak.mp3"
if [ "$FICHERO_DESTINO_A" -nt "$FICHERO_DESTINO" ];
then
    echo "Generando nuevo episodio Coffee-Break con cara A y cara B"
    rm "$FICHERO_DESTINO"
    ffmpeg -loglevel panic -i "concat:$FICHERO_DESTINO_A|$FICHERO_DESTINO_B" -acodec copy $FICHERO_DESTINO
fi
unset FILTRO

#DESCARGA COFFEE BREAK ONDA COLOR
FICHERO_DESTINO_ONDA_COLOR="/home/cuacfm/ownCloud/Podcast/ONDA-COLOR/Coffee-Break/coffee-break.mp3"
if [ "$FICHERO_DESTINO" -nt "$FICHERO_DESTINO_ONDA_COLOR" ];
then
   echo Copiando nuevo episodio Coffee-Break para Onda Color
   cp $FICHERO_DESTINO $FICHERO_DESTINO_ONDA_COLOR
fi

#DESCARGA DE TE CON GOTAS
PODCAST_RSS_URL="https://tecongotas.com/feed/podcast"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Te-Con-Gotas/tecongotas.mp3"
DURACION_MINIMA="3000"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE BALEA VERMELLA
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f11192462_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Balea-Vermella/baleavermella.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE AS WOMANSPLAINERS
PODCAST_RSS_URL="https://anchor.fm/s/4b7891a0/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/As-Womansplainers/womansplainers.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE RADIO ESCAPARATE

#DESCARGA DE GALIZA ALGO MAIS
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f1460651_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Galiza-Algo-Mais/galizaalgomais.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE ACARRIA SAVAGE TUNES
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f19230_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Alcarria-Savage-Tunes/alcarriasavagetunes.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE FÓRA DE MAPA
PODCAST_RSS_URL="https://anchor.fm/s/4bcefa54/podcast/rss"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Fora-de-mapa/forademapa.mp3"
DURACION_MINIMA="0"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA"

#DESCARGA DE UNIVERSO DE MISTERIOS
PODCAST_RSS_URL="https://www.ivoox.com/feed_fg_f1426304_filtro_1.xml"
FICHERO_DESTINO="/home/cuacfm/ownCloud/Podcast/Programas-Externos/Universo-De-Misterios/universodemisterios.mp3"
DURACION_MINIMA="2000"
EXCLUIR="Episodio exclusivo para mecenas"
$DESCARGADOR_PRIMER_PODCAST "$PODCAST_RSS_URL" "$FICHERO_DESTINO" "$DURACION_MINIMA" "" "$EXCLUIR"

