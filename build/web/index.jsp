<%@page import="Logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%
    HttpSession miSesion = request.getSession();
    if (miSesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    %>
<% Controladora control = new Controladora(); 
List <Empleado> listaEmpleados = control.traerEmpleados(); %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="COMPONENTS/Head.jsp" %>
            <link rel="stylesheet" href="./CSS/dashboard.css">
    </head>


    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
                <main class="dashboard">
                    <h2>Dashboard</h2>
                    <section class="insights">
                        <div class="card employees">
                            <span class="material-icons-sharp">
                                self_improvement
                            </span>
                            <div class="data">
                                <h3>Empleados Actuales</h3>
                                <h4>123</h4>
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
                        <div class="card">
                            <span class="material-icons-sharp">
                                shopping_cart
                            </span>
                            <div class="data">
                                <h3>Servicios Vendidos</h3>
                                <h4>123</h4>
                            </div>
                            <small>Las últimos 30 días.</small>
                        </div>
                        <div class="card">
                            <span class="material-icons-sharp">
                                stacked_line_chart
                            </span>
                            <div class="data">
                                <h3>Ganancias Totales</h3>
                                <h4>$25.000</h4>
                            </div>
                            <small>Las últimos 30 días.</small>
                        </div>
                    </section>
                    <section>
                        <h3>Ordenes recientes</h3>
                        <table class="card lista">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Paquete</th>
                                    <th>Fecha</th>
                                    <th>Cliente</th>
                                    <th>Empleado</th>
                                    <th>Monto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>123</td>
                                    <td>Tours a Cusco</td>
                                    <td>12/12/2019</td>
                                    <td>Juan Perez</td>
                                    <td>Cristian</td>
                                    <td>$25.000</td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="">Mostrar todas</a>
                    </section>
                </main>
        </div>
    </body>

    </html>