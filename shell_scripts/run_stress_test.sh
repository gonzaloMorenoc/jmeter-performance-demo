#!/bin/bash

# Definir variables
JMETER_HOME="/ruta/a/tu/jmeter/bin/jmeter"
SCRIPT="../scripts/reqres_api_test.jmx"
LOG_FILE="../results/load_test_log.jtl"
REPORT_FOLDER="../results/load_test_report"

# Limpiar ejecuciones anteriores
rm -f $LOG_FILE
rm -rf $REPORT_FOLDER

echo "Iniciando Prueba de Carga..."

# Ejecutar JMeter pasando parámetros dinámicos (-J)
$JMETER_HOME -n -t $SCRIPT \
    -l $LOG_FILE \
    -e -o $REPORT_FOLDER \
    -Jthreads=100 \
    -Jrampup=30 \
    -Jduration=600

echo "Prueba finalizada. Reporte generado en $REPORT_FOLDER"