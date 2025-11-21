#!/bin/bash
# Load Test: Carga media sostenida.

JMETER_BIN="jmeter"
SCRIPT="../scripts/reqres_api_test.jmx"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="../results/load_${TIMESTAMP}.jtl"
REPORT_FOLDER="../results/report_load_${TIMESTAMP}"

echo "--- Iniciando LOAD TEST (Carga Media) ---"

$JMETER_BIN -n -t $SCRIPT \
    -l $LOG_FILE \
    -e -o $REPORT_FOLDER \
    -Jthreads=20 \
    -Jrampup=30 \
    -Jduration=300 \
    -Jloops=-1

echo "--- Load Test finalizado. Reporte en: $REPORT_FOLDER ---"