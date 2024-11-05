## Aplicaciones Telemáticas <!-- omit in toc -->

# Midterm 1

*Año académico 2019-20*

## Instrucciones <!-- omit in toc -->

Tiempo disponible: 90 min

Explica **clara y brevemente** todo paso que des considerando que una respuesta
correcta sin explicación no necesariamente puntúa. Responde en hojas de examen.
Debes entregar este enunciado (se publicarán las soluciones). Indica
explícitamente cualquier suposición que hagas, aunque, en general, puedes
suponer lo siguiente:

* el emisor envía siempre todos los segmentos de la ventana o los que se
  indiquen (usando segmentos de MSS Bytes de longitud) antes de recibir el ACK
  que asiente el primer segmento enviado en dicha ventana
* los segmentos se asienten individualmente

> **Nota**
>
> Respuestas de estudiante. Las respuestas proporcionadas no son necesariamente
> correctas a menos que se indique lo contrario.

## Problema

La Agencia Espacial desea evaluar el uso de TCP con dos tecnologías de
comunicación desde la tierra con su base en la luna para mantener una conexión
persistente (ver imagen ). La primera de las tecnologías conectaría la tierra
con la luna usando un enlace desde la tierra con un satélite de comunicaciones
geoestacionario, donde habría un router, con 1Mbps de velocidad de enlace, y
desde el satélite a la luna otro enlace con 512Kbps de velocidad. El retardo de
propagación sería 0,05s entre la tierra y satélite y 1,20s entre satélite y la
luna.

La segunda tecnología con un enlace de 1Mbps y 1,25s de retardo de transmisión
uniría directamente la tierra con la luna sin mediación de satélites.

La ventana anunciada (`WIN`) para ambos extremos es de 628608 Bytes. El
parámetro Slow Start Threshold (`ssthresh`) es en ambos casos 68754 Bytes. Ambas
tecnologías utilizan una MTU muy grande de 9862 Bytes.

![alt text](fig-ES/fig1.png)

Figura 1: Tecnologías de interconexión Tierra-Luna

### Pregunta 1.1

Si la conexión estuviese abierta el tiempo suficiente, y en ausencia de
congestión o perdidas, ¿Qué valor máximo podría alcanzar la ventana de
congestión (`cwnd`)? ¿Por qué?

### Pregunta 1.2

Si la conexión estuviese abierta el tiempo suficiente, ¿Qué valor máximo podría
alcanzar la ventana efectiva ($V_{ef}$)? ¿Por qué?

### Pregunta 1.3

Calcula para ambas la ventana que permite el envío continuo (Vec)

### Pregunta 1.4

¿Cuántos RTTs se tardaría en alcanzar dicha ventana de envío continuo en ambos casos?

### Pregunta 1.5

La primera tecnología, la que emplea el satélite, tiene establecido el retardo
de retransmisión (`RTO`) en un `RTT` (RTO = RTT). Considera el caso de la Figura
2 en el que la conexión tiene una ventana de congestión de 100 (`cwnd` = 100)
tras recibir el $ACK_{78}$. En ese momento, en el periodo de tiempo RTT1, se
envían los segmentos $D_{78}$, $D_{79}$ y $D_{80}$ produciéndose un fallo que
impide que llegue el segmento $D_{78}$. En RTT2 no hay datos para enviar. En
RTT3 se deciden enviar los segmentos $D_{81}$, $D_{82}$ y $D_{83}$. Indica
claramente el valor de la ventana de congestión (`cwnd`), el slow start
threshold (`sstresh`) cuando varíen indicando el algoritmo usado para el cálculo
de la ventana o el tipo de congestión que se produce hasta el envío de $D_{83}$.

![alt text](fig-ES/fig2.png)

Figura 2: Intercambio de segmentos

### Pregunta 1.6

¿Qué valor de RTO mejoraría la conexión considerando un tráfico similar al de la
pregunta anterior? ¿por qué? Calcula los valores de la ventana de congestión
(`cwnd`), el slow start threshold (`sstresh`) cuando varíen indicando el
algoritmo usado para el cálculo de la ventana o el tipo de congestión que se
produce hasta el envío de $D_{83}$ en ese caso.

## Cuestión

### Pregunta 1.1

¿Cuántos registros (RR) y de qué tipo de los que conoces (SoA, MX, NS, A),
podrían encontrarse en un nodo del árbol que sabemos que es una zona (ha sido
delegado por el nivel superior)?
