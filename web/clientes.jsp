<%@page import="Logica.Cliente" %>
<%@page import="java.util.List" %>
<%@page import="Logica.Controladora" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                        if (miSesion.getAttribute("usuario") == null) {
                            response.sendRedirect("login.jsp");
                        } %>

<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    Controladora control = new Controladora();
    List<Cliente> listaClientes = control.traerClientes();
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
                            <h3>Empleados Totales</h3>
                            <h4>123</h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            person_add
                        </span>
                        <div class="data">
                            <h3>Nuevos Clientes</h3>
                            <h4>12</h4>
                        </div>
                        <small>Las últimos 30 días.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            person_add
                        </span>
                        <div class="data">
                            <h3>Nuevos Clientes</h3>
                            <h4>12</h4>
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
                                    <%= cliente.getNacionalidad()%>
                                </td>
                                <td>
                                    ?
                                </td>
                                <td>
                                    ?
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
                                    <a href="editar-empleado.jsp?id=<%= cliente.getId()%>&name=<%= cliente.getNombre()%>">
                                        <span class="material-icons-sharp">
                                            edit
                                        </span>
                                    </a>
                                    <a href="eliminar-empleado.jsp?id=<%= cliente.getId()%>">
                                        <span class="material-icons-sharp">
                                            delete
                                        </span>
                                    </a>
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

</html>