<%@page import="Logica.Cliente" %>
<%@page import="Logica.Empleado" %>
<%@page import="Logica.Venta" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<% HttpSession miSesion = request.getSession();
                                if (miSesion.getAttribute("usuario") == null) {
                                    response.sendRedirect("login.jsp");
                                } else {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date ahora = new Date();
    List<Venta> listaVentas = (List) request.getSession().getAttribute("listaVentas");
    List<Empleado> listaEmpleados = (List) request.getSession().getAttribute("listaEmpleados");
    List<Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
%>
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
                            shopping_cart
                        </span>
                        <div class="data">
                            <h3>Ventas<br>Totales</h3>
                            <h4>
                                <% if (listaVentas != null) {
                                                                                    out.print(listaVentas.size());
                                                                                } else {
                                                                                    out.print("0");
                                                                                } %>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            stacked_line_chart
                        </span>
                        <div class="data">
                            <h3>Ganancias<br>Totales</h3>
                            <h4>
                                $<% if (listaVentas != null) {
                                                                                    double total = 0;
                                                                                    for (Venta v : listaVentas) {
                                                                                        total += v.getCosto();
                                                                                    }
                                                                                    out.print(String.format("%.2f", total));
                                                                                } else {
                                                                                    out.print("0,00");
                                                                                }%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
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

<%} %>