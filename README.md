# pascuaRio: funciones para identificar las fechas de Semana Santa de 1997 a 2050 <img src='/logo_pascuario.png' align="right" height="200" />
pascuaRio es un paquete para R, que proporciona 3 funciones para:

* Indicar si una fecha pertece a la Semana Santa, desde el año 1997 hasta el año 2050. De esta forma, devuelve (TRUE/FALSE) si la fecha de un data frame corresponde a Semana Santa.
* También indica a que año corresponde esa Semana Santa, ejemplo: la fecha "2025-04-13", es Semana Santa (2025), pero la fecha "2025-04-12" no es de Semana Santa, entonces es FALSE.
* Finalmente, indentifica qué día de la semana mayor es (Domingo de Ramos, Lunes Santo, etc.), ejemplo: la fecha "2025-04-13" es "Domingo de Ramos", pero la fecha "2025-04-12" no es de Semana Santa, entonces es NA.
  
**Este paquete se creo con fines de análisis estadístico en contextos como estudios de capacidad hotelera, incidencia delictiva, emergencias prehospitalarias, emergencias urbanas, entre otros, siempre y cuando los eventos hayan ocurrido durante la Semana Santa.**

**Este paquete no fue creado con fines religiosos, sino como una herramienta para apoyar a los analistas de datos que en algún momento de su carrera deben de realizar estudios sobre información que haya ocurrido durante este periodo.**

El paquete considera únicamente el periodo que va desde el Domingo de Ramos hasta el Domingo de Resurrección de cada año, excluyendo otros días como el Miércoles de Ceniza. 

En la carpeta "data" se incluye el data frame con todas las fechas de la semana mayor desde 1997 hasta el 2050. 

Las fechas que se quieran analizar deben de estar en el formato ymd, por lo que se recomienda el uso de as.Date o del paquete lubridate.
