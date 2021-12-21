<%@page import="Logica.MedioPago" %>
<%@page import="Logica.Controladora" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession miSesion = request.getSession();
                if (miSesion.getAttribute("usuario") == null) {
                    response.sendRedirect("login.jsp");
                } %>
<% String id = request.getParameter("id");
                    MedioPago medio = null;
                    if (id != null) {
                        Controladora control = new Controladora();
                        medio = control.traerMedio(Integer.parseInt(id));
                    }%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="./COMPONENTS/Head.jsp" %>
        <link rel="stylesheet" href="./CSS/medios.css">
    </head>

    <body>
        <div class="container">
            <%@include file="./COMPONENTS/Nav.jsp" %>
            <main class="empleado">
                <h2>
                    <% if (id != null) {%>
                    <%= medio.getNombre()%>
                    <% } else { %> Nuevo Medio <% } %>
                </h2>
                <section class="card">
                    <form class="form colums2" action="SvMedio" method="POST">
                        <div class="field">
                            <label for="name">Nombre</label>
                            <input type="text" name="name" id="name" <% if (id != null) {%> value="<%=medio.getNombre()%>" <% } %> required>
                        </div>
                        <div class="field">
                            <label for="interest">Comisión</label>
                            <input type="number" name="interest" id="interest" <% if (id != null) {%> value="<%=medio.getComision()%>" <% } %> required>
                        </div>
                        <% if (id != null) {%>
                        <input type="hidden" name="id" value="<%=medio.getCodigo()%>">
                        <% } %>
                        <input type="hidden" name="action" value="<% if (id != null) {%>UPDATE<% } else { %>CREATE<% }%>">
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