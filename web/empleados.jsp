<%@page import="Logica.Venta" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="Logica.Empleado" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                            if (miSesion.getAttribute("usuario") == null) {
                                response.sendRedirect("login.jsp");
                            } else {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date ahora = new Date();
    List<Empleado> listaEmpleados = (List) request.getSession().getAttribute("listaEmpleados");
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
            <main class="empleados">
                <h2>Empleados</h2>
                <section class="insights">
                    <div class="card">
                        <span class="material-icons-sharp">
                            groups
                        </span>
                        <div class="data">
                            <h3>Empleados<br>Totales</h3>
                            <h4>
                                <%= listaEmpleados.size()%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            person_add
                        </span>
                        <div class="data">
                            <h3>Nuevos<br>Empleados</h3>
                            <h4>
                                <% int nuevosEmpleados = 0;
                                                                    for (Empleado empleado : listaEmpleados) {
                                                                        if (empleado.getFechaContratacion().getMonth() == ahora.getMonth() && empleado.getFechaContratacion().getYear() == ahora.getYear()) {
                                                                            nuevosEmpleados++;
                                                                        }
                                                                    }%>
                                <%= nuevosEmpleados%>
                            </h4>
                        </div>
                        <small>El último mes del corriente año.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            monetization_on
                        </span>
                        <div class="data">
                            <h3>Salarios<br>Totales</h3>
                            <h4>
                                <% double salariosTotales = 0;
                                                                    for (Empleado empleado : listaEmpleados) {
                                                                        salariosTotales += empleado.getSueldo();
                                                                    }%>
                                $<%= String.format("%.2f", salariosTotales)%>
                            </h4>
                        </div>
                        <small>El último mes del corriente año.</small>
                    </div>
                    <a class="border-card" href="./empleado.jsp">
                        <span class="material-icons-sharp">
                            add
                        </span>
                        <h3>Agregar<br>Empleado</h3>
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
                                <th>Puesto</th>
                                <th>Ingreso</th>
                                <th>Salario</th>
                                <th>Ventas</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Empleado empleado : listaEmpleados) {%>
                            <tr>
                                <td>
                                    <%= empleado.getId()%>
                                </td>
                                <td>
                                    <%= empleado.getNombre()%>
                                </td>
                                <td>
                                    <%= empleado.getApellido()%>
                                </td>
                                <td>
                                    <%= ahora.getYear() - empleado.getFechaNac().getYear()%>
                                </td>
                                <td>
                                    <%= empleado.getNacionalidad()%>
                                </td>
                                <td>
                                    <%= empleado.getCargo()%>
                                </td>
                                <td>
                                    <%= sdf.format(empleado.getFechaContratacion())%>
                                </td>
                                <td>
                                    $<%= String.format("%.2f", empleado.getSueldo())%>
                                </td>
                                <td>
                                    <%= empleado.getListaVentas().size()%>
                                </td>
                                <td>
                                    <a href="https://wa.me/<%= empleado.getCelular()%>">
                                        <span class="material-icons-sharp">
                                            whatsapp
                                        </span>
                                    </a>
                                    <a href="mailto: <%= empleado.getEmail()%>">
                                        <span class="material-icons-sharp">
                                            email
                                        </span>
                                    </a>
                                    <a href="./empleado.jsp?id=<%=empleado.getId()%>" onclick="return confirm('¿Está seguro que desea editar este empleado?')">
                                        <span class="material-icons-sharp">
                                            edit
                                        </span>
                                    </a>
                                    <form action="SvEmpleado" method="POST" onsubmit="return confirm('¿Está seguro que desea eliminar el empleado?')">
                                        <input type="hidden" name="id" value="<%= empleado.getId()%>">
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
                                    alert("Empleado eliminado correctamente");
        <% } else if (request.getParameter("eliminado") != null && request.getParameter("eliminado").equals("false")) { %>
                                    alert("No se pudo eliminar el empleado");
        <% }%>

        <% if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("true")) { %>
                                    alert("Empleado editado correctamente");
        <% } else if (request.getParameter("actualizado") != null && request.getParameter("actualizado").equals("false")) { %>
                                    alert("No se pudo editar el empleado");
        <% }%>
    </script>

</html>

<% } %>