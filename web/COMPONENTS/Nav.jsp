<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <nav>
        <header>
            <h1 class="logo">polo<span>tic</span> tours</h1>
            <div class="close" id="close-btn">
                <span class="material-icons-sharp">
                    close
                </span>
            </div>
        </header>
        <a href="">
            <figure class="profile">
                <div>
                    <p>Bienvenido, <b>
                            <%= miSesion.getAttribute("nombre") %>
                        </b>.</p>
                    <small>Admin</small>
                </div>
            </figure>
        </a>
        <ul>
            <li <% if (page.toString().contains("index_jsp")) { %> class="active" <% } %> >
                    <a href="./">
                        <span class="material-icons-sharp">
                            grid_view
                        </span>
                        <h3>Dashboard</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("cliente")) { %> class="active" <% } %> >
                    <a href="./clientes.jsp">
                        <span class="material-icons-sharp">
                            person
                        </span>
                        <h3>Clientes</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("empleado")) { %> class="active" <% } %> >
                    <a href="./empleados.jsp">
                        <span class="material-icons-sharp">
                            groups
                        </span>
                        <h3>Empleados</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("servicio")) { %> class="active" <% } %> >
                    <a href="./servicios.jsp">
                        <span class="material-icons-sharp">
                            hiking
                        </span>
                        <h3>Servicios</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("paquete")) { %> class="active" <% } %> >
                    <a href="./paquetes.jsp">
                        <span class="material-icons-sharp">
                            receipt
                        </span>
                        <h3>Paquetes</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("medio")) { %> class="active" <% } %> >
                    <a href="./medios.jsp">
                        <span class="material-icons-sharp">
                            credit_card
                        </span>
                        <h3>Medios de Pago</h3>
                    </a>
            </li>
            <li <% if (request.getRequestURI().contains("venta")) { %> class="active" <% } %> >
                    <a href="./ventas.jsp">
                        <span class="material-icons-sharp">
                            sell
                        </span>
                        <h3>Ventas</h3>
                    </a>
            </li>
            <li>
                <a href="SvUsuario">
                    <span class="material-icons-sharp">
                        logout
                    </span>
                    <h3>Cerrar Sesión</h3>
                </a>
            </li>
        </ul>
    </nav>