<%@page import="Logica.MedioPago" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                        if (miSesion.getAttribute("usuario") == null) {
                            response.sendRedirect("login.jsp");
                        } %>

<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    List<MedioPago> listaMedios = (List) request.getSession().getAttribute("listaMedios");
%>

<!DOCTYPE html>
<html>

    <head>
        <%@include file="COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/medios.css">
    </head>

    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
            <main class="medios">
                <h2>Medios de Pago</h2>
                <section class="insights">
                    <div class="card">
                        <span class="material-icons-sharp">
                            format_list_bulleted
                        </span>
                        <div class="data">
                            <h3>Medios de pago<br>Totales</h3>
                            <h4>
                                <%= listaMedios.size()%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            expand_more
                        </span>
                        <div class="data">
                            <h3>Comisión<br>Mayor</h3>
                            <h4>
                                <% if (listaMedios.size() > 0) {
                                        int mayor = 0;
                                        for (MedioPago medio : listaMedios) {
                                            if (medio.getComision() > mayor) {
                                                mayor = medio.getComision();
                                            }
                                        }
                                %>
                                <%= mayor%>%
                                <% } else { %>
                                0
                                <% } %>
                            </h4>
                        </div>
                        <small>El último mes del corriente año.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            expand_less
                        </span>
                        <div class="data">
                            <h3>Comisión<br>Menor</h3>
                            <h4>
                                <% if (listaMedios.size() > 0) {
                                                                    int menor = 1000;
                                                                    for (MedioPago medio : listaMedios) {
                                                                        if (medio.getComision() < menor) {
                                                                            menor = medio.getComision();
                                                                        }
                                                                    }%>
                                <%= menor%>%
                                <% } else { %>
                                0
                                <% } %>
                        </div>
                        <small>El último mes del corriente año.</small>
                    </div>
                    <a class="border-card" href="./medio.jsp">
                        <span class="material-icons-sharp">
                            add
                        </span>
                        <h3>Agregar<br>Medio de pago</h3>
                    </a>
                </section>
                <section>
                    <table class="card lista">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Comisión</th>
                                <th>Nº Clientes</th>
                                <th>Nº Ventas</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (MedioPago medio : listaMedios) {%>
                            <tr>
                                <td>
                                    <%= medio.getCodigo()%>
                                </td>
                                <td>
                                    <%= medio.getNombre()%>
                                </td>
                                <td>
                                    <%= medio.getComision()%>%
                                </td>
                                <td>?</td>
                                <td>?</td>
                                <td>
                                    <a href="medio.jsp?id=<%= medio.getCodigo()%>" onclick="return confirm('¿Está seguro que desea editar este medio de pago?')">
                                        <span class="material-icons-sharp">
                                            edit
                                        </span>
                                    </a>
                                    <form action="SvMedio" method="POST" onsubmit="return confirm('¿Está seguro que desea eliminar el medio de pago?')">
                                        <input type="hidden" name="id" value="<%= medio.getCodigo()%>">
                                        <input type="hidden" name="action" value="DELETE">
                                        <button type="submit">
                                            <span class="material-icons-sharp">
                                                delete
                                            </span>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>

                        </tbody>
                    </table>
                    <a href="">Mostrar todos</a>
                </section>
            </main>
        </div>
    </body>

    <script>
        <% if (request.getParameter("eliminado") != null && request.getParameter("eliminado").equals("true")) { %>
                                alert("Medio de pago eliminado correctamente");
        <% } else if (request.getParameter("eliminado") != null && request.getParameter("eliminado").equals("false")) { %>
                                alert("No se pudo eliminar el Medio de pago");
        <% }%>

        <% if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("true")) { %>
                                alert("Medio de pago editado correctamente");
        <% } else if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("false")) { %>
                                alert("No se pudo editar el Medio de pago");
        <% }%>

        <% if (request.getParameter("creado") != null && request.getParameter("creado").equals("true")) { %>
                                alert("Medio de pago creado correctamente");
        <% } else if (request.getParameter("creado") != null && request.getParameter("creado").equals("false")) { %>
                                alert("No se pudo crear el Medio de pago");
        <% }%>
    </script>

</html>