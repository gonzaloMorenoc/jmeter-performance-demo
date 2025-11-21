#!/bin/bash
# Smoke Test: Verifica que el script funcione correctamente con carga mínima.

JMETER_BIN="jmeter" # Asegúrate de que 'jmeter' esté en tu PATH, si no pon la ruta completa
SCRIPT="../scripts/reqres_api_test.jmx"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="../results/smoke_${TIMESTAMP}.jtl"
REPORT_FOLDER="../results/report_smoke_${TIMESTAMP}"

echo "--- Iniciando SMOKE TEST ---"

$JMETER_BIN -n -t $SCRIPT \
    -l $LOG_FILE \
    -e -o $REPORT_FOLDER \
    -Jthreads=1 \
    -Jrampup=1 \
    -Jduration=10 \
    -Jloops=1

echo "--- Smoke Test finalizado. Reporte en: $REPORT_FOLDER ---"