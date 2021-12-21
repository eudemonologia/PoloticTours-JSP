<%@page import="Logica.Venta"%>
<%@page import="java.util.Date" %>
<%@page import="Logica.Cliente" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                        if (miSesion.getAttribute("usuario") == null) {
                            response.sendRedirect("login.jsp");
                        } else {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    Date ahora = new Date();
    List<Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/empleados.css">
    </head>

    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
            <main class="clientes">
                <h2>Clientes</h2>
                <section class="insights">
                    <div class="card">
                        <span class="material-icons-sharp">
                            self_improvement
                        </span>
                        <div class="data">
                            <h3>Clientes<br>Totales</h3>
                            <h4>
                                <%= listaClientes.size()%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            person_add
                        </span>
                        <div class="data">
                            <h3>Clientes<br>Activos</h3>
                            <h4>0</h4>
                        </div>
                        <small>El último mes del corriente año.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            monetization_on
                        </span>
                        <div class="data">
                            <h3>Compras<br>Totales</h3>
                            <h4>
                                $<%= String.format("%.2f", 0.0)%>
                            </h4>
                        </div>
                        <small>Las últimos 30 días.</small>
                    </div>
                    <a class="border-card" href="cliente.jsp">
                        <span class="material-icons-sharp">
                            add
                        </span>
                        <h3>Agregar<br>Cliente</h3>
                    </a>
                </section>
                <section>
                    <table class="card lista">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Edad</th>
                                <th>Nacionalidad</th>
                                <th>Compras</th>
                                <th>Promedio</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Cliente cliente : listaClientes) {%>
                            <tr>
                                <td>
                                    <%= cliente.getId()%>
                                </td>
                                <td>
                                    <%= cliente.getNombre()%>
                                </td>
                                <td>
                                    <%= cliente.getApellido()%>
                                </td>
                                <td>
                                    <%= ahora.getYear() - cliente.getFechaNac().getYear()%>
                                </td>
                                <td>
                                    <%= cliente.getNacionalidad()%>
                                </td>
                                <td>
                                    <%= cliente.getListaCompras().size()%>
                                </td>
                                <td>
                                    <% if (cliente.getListaCompras().size() > 0) {
                                            double promedio = 0;
                                            for (Venta compra : cliente.getListaCompras()) {
                                                promedio += compra.getCosto();
                                            }
                                            promedio = promedio / cliente.getListaCompras().size();
                                    %>
                                    $<%= String.format("%.2f", promedio)%>
                                    <% } else { %>
                                    $0.00
                                    <% }%>
                                </td>
                                <td>
                                    <a href="https://wa.me/<%= cliente.getCelular()%>">
                                        <span class="material-icons-sharp">
                                            whatsapp
                                        </span>
                                    </a>
                                    <a href="mailto: <%= cliente.getEmail()%>">
                                        <span class="material-icons-sharp">
                                            email
                                        </span>
                                    </a>
                                    <a href="./cliente.jsp?id=<%= cliente.getId()%>" onclick="return confirm('¿Está seguro que desea editar este Cliente?')">
                                        <span class="material-icons-sharp">
                                            edit
                                        </span>
                                    </a>
                                    <form action="SvCliente" method="POST" onsubmit="return confirm('¿Está seguro que desea eliminar este Cliente?')">
                                        <input type="hidden" name="id" value="<%= cliente.getId()%>">
                                        <input type="hidden" name="action" value="DELETE">
                                        <button type="submit">
                                            <span class="material-icons-sharp">
                                                delete
                                            </span>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <a href="">Mostrar todos</a>
                </section>
            </main>
        </div>
    </body>

    <script>
        <% if (request.getParameter("eliminado") != null && request.getParameter("eliminado").equals("true")) { %>
                                alert("Cliente eliminado correctamente");
        <% } else if (request.getParameter("eliminado") != null && request.getParameter("eliminado").equals("false")) { %>
                                alert("No se pudo eliminar el cliente");
        <% }%>

        <% if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("true")) { %>
                                alert("Cliente editado correctamente");
        <% } else if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("false")) { %>
                                alert("No se pudo editar el cliente");
        <% }%>
    </script>

</html>

<% } %>