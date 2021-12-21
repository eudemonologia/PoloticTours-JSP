<%@page import="java.text.SimpleDateFormat" %>
    <%@page import="Logica.Empleado" %>
        <%@page import="java.util.List" %>
            <%@page import="Logica.Controladora" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <% HttpSession miSesion=request.getSession(); if (miSesion.getAttribute("usuario")==null) { response.sendRedirect("login.jsp"); } %>

                        <% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); Controladora control=new Controladora(); List <Empleado> listaEmpleados = control.traerEmpleados();
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
                                                            <th>Nacionalidad</th>
                                                            <th>Puesto</th>
                                                            <th>Ingreso</th>
                                                            <th>Salario</th>
                                                            <th>Ventas</th>
                                                            <th>Promedio</th>
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
                                                                    <%= empleado.getNacionalidad()%>
                                                                </td>
                                                                <td>
                                                                    <%= empleado.getCargo()%>
                                                                </td>
                                                                <td>
                                                                    <%= sdf.format(empleado.getFechaContratacion())%>
                                                                </td>
                                                                <td>
                                                                    <%= empleado.getSueldo()%>
                                                                </td>
                                                                <td>
                                                                    ?
                                                                </td>
                                                                <td>
                                                                    ?
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
                                                                    <a href="./empleado.jsp?id=<%=empleado.getId()%>&name=<%=empleado.getNombre()%>" onclick="return confirm('¿Está seguro que desea editar este empleado?')">
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
                            </script>

                            </html>