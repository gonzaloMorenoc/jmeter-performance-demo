#!/bin/bash
# Stress Test: Busca el punto de quiebre (Carga alta).

JMETER_BIN="jmeter"
SCRIPT="../scripts/reqres_api_test.jmx"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="../results/stress_${TIMESTAMP}.jtl"
REPORT_FOLDER="../results/report_stress_${TIMESTAMP}"

echo "--- Iniciando STRESS TEST (¡Cuidado con el API!) ---"

$JMETER_BIN -n -t $SCRIPT \
    -l $LOG_FILE \
    -e -o $REPORT_FOLDER \
    -Jthreads=80 \
    -Jrampup=60 \
    -Jduration=600 \
    -Jloops=-1

echo "--- Stress Test finalizado. Reporte en: $REPORT_FOLDER ---"