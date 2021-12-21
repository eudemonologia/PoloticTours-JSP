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
        <link rel="stylesheet" href="./CSS/servicios.css">
    </head>

    <body>
        <div class="container">
            <%@include file="COMPONENTS/Nav.jsp" %>
            <main class="servicios">
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
                    <a class="border-card" href="servicio.jsp">
                        <span class="material-icons-sharp">
                            add
                        </span>
                        <h3>Agregar<br>servicio</h3>
                    </a>
                </section>
                <section>
                    <table class="card lista">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Destino</th>
                                <th>Fecha</th>
                                <th>Costo</th>
                                <th>Ventas</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>123</td>
                                <td>Hotel por noche</td>
                                <td>Cancún</td>
                                <td>12/12/2019</td>
                                <td>$1,000</td>
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
                            <tr>
                                <td>123</td>
                                <td>Hotel por noche</td>
                                <td>Cancún</td>
                                <td>12/12/2019</td>
                                <td>$1,000</td>
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