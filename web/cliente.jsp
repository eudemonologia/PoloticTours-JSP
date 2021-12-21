<%@page import="Logica.Controladora" %>
<%@page import="Logica.Cliente" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                if (miSesion.getAttribute("usuario") == null) {
                    response.sendRedirect("login.jsp");
                } %>
<% String id = request.getParameter("id");
                    String nombre = request.getParameter("name");
                    Cliente cliente = null;
                    if (id != null && nombre != null) {
                        Controladora control = new Controladora();
                        cliente = control.traerCliente(Integer.parseInt(id));
                    }%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="./COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/empleados.css">
    </head>

    <body>
        <div class="container">
            <%@include file="./COMPONENTS/Nav.jsp" %>
            <main class="empleado">
                <h2>
                    <% if (id != null) {%>
                    <%= cliente.getNombre()%>
                    <%=cliente.getApellido()%>
                    <% } else { %> Empleados <% } %>
                </h2>
                <section class="card">
                    <form class="form" action="SvCliente" method="POST" >
                        <div class="field">
                            <label for="name">Nombre</label>
                            <input type="text" name="name" id="name" <% if (id != null) {%> value="<%=cliente.getNombre()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="lastname">Apellido</label>
                            <input type="text" name="lastname" id="lastname" <% if (id != null) {%> value="<%=cliente.getApellido()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="dni">DNI</label>
                            <input type="text" name="dni" id="dni" <% if (id != null) {%> value="<%=cliente.getDni()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="">Email</label>
                            <input type="email" name="email" id="email" <% if (id != null) {%> value="<%=cliente.getEmail()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="phone">Teléfono</label>
                            <input type="tel" name="phone" id="phone" <% if (id != null) {%> value="<%=cliente.getCelular()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="address">Dirección</label>
                            <input type="text" name="address" id="address" <% if (id != null) {%> value="<%=cliente.getDireccion()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="nationality">Nacionalidad</label>
                            <input type="text" name="nationality" id="nationality" <% if (id != null) {%> value="<%=cliente.getNacionalidad()%>" <% }%> required>
                        </div>
                        <div class="field">
                            <label for="birthdate">Fecha de nacimiento</label>
                            <input type="date" name="birthdate" id="birthdate" required>
                        </div>
                        <button type="submit">
                            <span class="material-icons-sharp">
                                save
                            </span>
                            Guardar
                        </button>
                    </form>
                </section>
            </main>
        </div>
    </body>

</html>