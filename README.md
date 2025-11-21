# JMeter Performance Testing Framework - ReqRes API

Este repositorio contiene una suite profesional de pruebas de rendimiento automatizadas utilizando **Apache JMeter**. El objetivo es demostrar estrategias de performance testing (Load, Stress, Smoke) sobre una API REST pública.

## Arquitectura del Proyecto

El proyecto sigue una estructura modular orientada a integración continua (CI/CD):

* `scripts/`: Contiene el Test Plan único (`.jmx`) altamente parametrizado.
* `data/`: Archivos CSV para Data Driven Testing (simulación de usuarios reales).
* `shell_scripts/`: Scripts de ejecución Non-GUI para diferentes escenarios.
* `results/`: Salida de reportes HTML y logs JTL (excluido en gitignore).

## Estrategias de Pruebas Incluidas

El Test Plan está diseñado para adaptarse mediante inyección de propiedades (`-J`) a los siguientes escenarios:

| Tipo de Test | Usuarios (Threads) | Ramp-Up | Duración | Objetivo |
| :--- | :--- | :--- | :--- | :--- |
| **Smoke Test** | 1 | 1s | 1 iteración | Validar sanidad del script y conectividad. |
| **Load Test** | 20 | 30s | 5 min | Validar estabilidad bajo carga esperada. |
| **Stress Test** | 80+ | 60s | 10 min | Encontrar el "Breakpoint" de la API. |

## Tecnologías Utilizadas

* **Apache JMeter 5.x**
* **Shell Scripting (Bash/Batch)** para automatización.
* **ReqRes API** (Dummy API para demos).
* **CSV Data Set Config** para variabilidad de datos.

## Cómo ejecutar las pruebas

### Prerrequisitos
* Tener Java instalado (`java -version`).
* Tener JMeter instalado y añadido al PATH del sistema.

### Ejecución por consola (CLI)

Navega a la carpeta `shell_scripts` y ejecuta el escenario deseado:

**En Linux/Mac:**
```bash
cd shell_scripts
chmod +x *.sh
./run_load_test.sh