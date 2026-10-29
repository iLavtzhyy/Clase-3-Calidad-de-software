<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.empresa.dto.UsuarioDTO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Arquitectura Empresarial con EJB</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; color: #202033; }
        h2 { color: #34277d; }
        table { border-collapse: collapse; min-width: 420px; }
        th, td { border: 1px solid #ddd; padding: 10px 14px; text-align: left; }
        th { background: #6955ff; color: white; }
        tr:nth-child(even) { background: #f6f5ff; }
    </style>
</head>
<body>
    <h2>Lista procesada por un EJB Stateless</h2>
    <table>
        <thead><tr><th>Nombre</th><th>Rol Asignado</th></tr></thead>
        <tbody>
        <% List<UsuarioDTO> usuarios = (List<UsuarioDTO>) request.getAttribute("usuarios");
           if (usuarios != null) {
               for (UsuarioDTO usuario : usuarios) { %>
        <tr><td><%= usuario.getNombre() %></td><td><%= usuario.getRol() %></td></tr>
        <%     }
           } %>
        </tbody>
    </table>
</body>
</html>
