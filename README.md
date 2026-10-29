# Clase 3: Proyecto Backend con patrones y EJB

Aplicación Maven con Jakarta EE 10 que implementa DTO, DAO, EJB Stateless, Servlet controlador y JSP. El DAO simula una consulta y devuelve a Ana (Administrador) y Carlos (Usuario Final).

## Ejecutar

1. Ejecuta `./preparar-wildfly.ps1` una vez para descargar WildFly EE 10 41.0.1.
2. Ejecuta `./iniciar.ps1`. Compila el proyecto, despliega `ejb-demo.war` y mantiene WildFly activo en esa terminal.
3. Abre http://localhost:8080/ejb-demo/app

Detén el servidor con Ctrl+C. Para volver a desplegar cambios, usa `./actualizar.ps1` mientras WildFly sigue activo.

Se requiere Java 17 para el servidor; la aplicación compila con nivel Java 11.
