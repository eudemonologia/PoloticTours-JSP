<%@page import="Logica.Venta" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
    if (miSesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {
        List<Venta> listaVentas = (List) request.getSession().getAttribute("listaVentas");
%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/ventas.css">
    </head>

    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
            <main class="medios">
                <h2>Ventas</h2>
                <section class="insights">
                    <div class="card">
                        <span class="material-icons-sharp">
                            add_shopping_cart
                        </span>
                        <div class="data">
                            <h3>Ventas<br>Totales</h3>
                            <h4>
                                <%= listaVentas.size()%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            autorenew
                        </span>
                        <div class="data">
                            <h3>Ventas<br>Recientes</h3>
                            <h4>12</h4>
                        </div>
                        <small>Las últimos 30 días.</small>
                    </div>
                    <div class="card">
                        <span class="material-icons-sharp">
                            stacked_line_chart
                        </span>
                        <div class="data">
                            <h3>Ganancias<br>Totales</h3>
                            <h4>
                                <% double total = 0;
                                    for (Venta v : listaVentas) {
                                        total += v.getCosto();
                                    }%>
                                $<%= String.format("%.2f", total)%>
                            </h4>
                        </div>
                        <small>Desde el inicio de actividades.</small>
                    </div>
                    <a class="border-card" href="venta.jsp">
                        <span class="material-icons-sharp">
                            add
                        </span>
                        <h3>Agregar<br>Venta</h3>
                    </a>
                </section>
                <section>
                    <table class="card lista">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Paquete</th>
                                <th>Fecha</th>
                                <th>Cliente</th>
                                <th>Empleado</th>
                                <th>Monto</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>123</td>
                                <td>Tours de Cusco</td>
                                <td>12/12/2019</td>
                                <td>Daniel</td>
                                <td>Cristian</td>
                                <td>$1.000</td>
                                <td>
                                    <a href="">
                                        <span class="material-icons-sharp">
                                            edit
                                        </span>
                                    </a>
                                    <a href="">
                                        <span class="material-icons-sharp">
                                            delete
                                        </span>
                                    </a>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <a href="">Mostrar todos</a>
                </section>
            </main>
        </div>
    </body>

</html>

<% }%>