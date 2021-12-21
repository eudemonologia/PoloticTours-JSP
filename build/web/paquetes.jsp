<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    HttpSession miSesion = request.getSession();
    if (miSesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    %>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/paquetes.css">
    </head>

    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
            <main class="paquetes">
            <h2>Paquetes</h2>
            <section class="insights">
                <div class="card">
                    <span class="material-icons-sharp">
                        format_list_bulleted
                    </span>
                    <div class="data">
                        <h3>Paquetes<br>Totales</h3>
                        <h4>123</h4>
                    </div>
                    <small>Desde el inicio de actividades.</small>
                </div>
                <div class="card">
                    <span class="material-icons-sharp">
                        shopping_basket
                    </span>
                    <div class="data">
                        <h3>Paquete<br>Más grande</h3>
                        <h4>12</h4>
                    </div>
                    <small>Las últimos 30 días.</small>
                </div>
                <div class="card">
                    <span class="material-icons-sharp">
                        percent
                    </span>
                    <div class="data">
                        <h3>Descuento<br>Mayor</h3>
                        <h4>12</h4>
                    </div>
                    <small>Las últimos 30 días.</small>
                </div>
                <a class="border-card" href="paquete.jsp">
                    <span class="material-icons-sharp">
                        add
                    </span>
                    <h3>Agregar<br>Paquete</h3>
                </a>
            </section>
            <section>
                <table class="card lista">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Servicios</th>
                            <th>Descuento</th>
                            <th>Costo</th>
                            <th>Ventas</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>123</td>
                            <td>Paquete 1</td>
                            <td>
                                <ul>
                                    <li>Servicio 1</li>
                                    <li>Servicio 2</li>
                                    <li>Servicio 3</li>
                                </ul>
                            </td>
                            <td>10%</td>
                            <td>$100</td>
                            <td>24</td>
                            <td>
                                <a href="">
                                    <span class="material-icons-sharp">
                                        shopping_cart
                                    </span>
                                </a>
                                <a href="">
                                    <span class="material-icons-sharp">
                                        description
                                    </span>
                                </a>
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