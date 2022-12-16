NOW=`date '+%F_%H:%M:%S'`;
RUTA=$(dirname "$0");
NERRORES=10000000
#NLOAD=1000000

log_filename=$RUTA"/logs/control_tagobdatcu_$NOW.log"
ctl_filename=$RUTA"/control.ctl"
BAD_FILENAME=$RUTA"/badfile/tagobdatcu_$NOW.bad"
DISCARD_FILENAME=$RUTA"/discard/tagobdatcu_$NOW.dsc"
DATAFILE="/home/b337289/Documentos/DOCS_CMAX/mapa_cfdi_4.0/cargamasiva/data/RFC_GOBIERNODATOS_SEPTIEMBRE2022.csv"

echo ----------------------------------------
echo $log_filename
echo ----------------
echo $ctl_filename
echo ----------------
echo $BAD_FILENAME
echo ----------------------------------------

#sqlldr USR654770/USR654770@10.63.32.15:1521/RCBDDES \ DATA=$DATAFILE  \ LOG=$log_filename \ BAD=$BAD_FILENAME \ DISCARD=$DISCARD_FILENAME \ ERRORS=$NERRORES \ LOAD=$NLOAD \ CONTROL=$ctl_filename

sqlldr USR654770/USR654770@10.63.32.15:1521/RCBDDES \
DATA=$DATAFILE  \
LOG=$log_filename \
BAD=$BAD_FILENAME \
DISCARD=$DISCARD_FILENAME \
ERRORS=$NERRORES \
CONTROL=$ctl_filename