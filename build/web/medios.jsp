<%@page import="Logica.MedioPago" %>
    <%@page import="java.util.List" %>
        <%@page import="Logica.Controladora" %>
            <%@page import="java.text.SimpleDateFormat" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <% HttpSession miSesion=request.getSession(); if (miSesion.getAttribute("usuario")==null) { response.sendRedirect("login.jsp"); } %>

                        <% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); Controladora control=new Controladora(); List<MedioPago> listaMedios = control.traerMedios();
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
                                                <a class="border-card" href="nuevo-empleado.html">
                                                    <span class="material-icons-sharp">
                                                        add
                                                    </span>
                                                    <h3>Agregar<br>medio de pago</h3>
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
                                                        <% for (MedioPago medio : listaMedios) { %>
                                                            <tr>
                                                                <td>
                                                                    <%= medio.getCodigo() %>
                                                                </td>
                                                                <td>
                                                                    <%= medio.getNombre() %>
                                                                </td>
                                                                <td>
                                                                    <%= medio.getComision() * 100 %>%
                                                                </td>
                                                                <td>?</td>
                                                                <td>?</td>
                                                                <td>
                                                                    <a href="editar-empleado.jsp?id=<%= medio.getCodigo() %>">
                                                                        <span class="material-icons-sharp">
                                                                            edit
                                                                        </span>
                                                                    </a>
                                                                    <a href="eliminar-empleado.jsp?id=<%= medio.getCodigo() %>">
                                                                        <span class="material-icons-sharp">
                                                                            delete
                                                                        </span>
                                                                    </a>
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

                            </html>