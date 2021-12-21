<%@page import="Logica.Servicio" %>
    <%@page import="Logica.Controladora" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <% HttpSession miSesion=request.getSession(); if (miSesion.getAttribute("usuario")==null) { response.sendRedirect("login.jsp"); } %>
                <% String id=request.getParameter("id"); Servicio servi=null; if (id !=null) { Controladora control=new Controladora(); servi=control.traerServicio(Integer.parseInt(id)); }%>
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
                                        <% if (id !=null) {%>
                                            <%= servi.getNombre()%>
                                                <% } else { %> Nuevo Servicio <% } %>
                                    </h2>
                                    <section class="card">
                                        <form class="form colums2" action="SvServicio" method="POST">
                                            <div class="field">
                                                <label for="name">Nombre</label>
                                                <input type="text" name="name" id="name" <% if (id !=null) {%> value="<%=servi.getNombre()%>" <% } %> required>
                                            </div>
                                            <div class="field">
                                                <label for="destino">Destino</label>
                                                <input type="text" name="destino" id="destino" <% if (id !=null) {%> value="<%=servi.getDestino()%>" <% } %> required>
                                            </div>
                                            <div class="field">
                                                <label for="costo">Costo</label>
                                                <input type="number" name="costo" id="costo" <% if (id !=null) {%> value="<%=servi.getCosto()%>" <% } %> required>
                                            </div>
                                            <div class="field">
                                                <label for="fecha">Fecha</label>
                                                <input type="date" name="fecha" id="fecha" <% if (id !=null) {%> value="<%=servi.getFecha()%>" <% } %> required>
                                            </div>
                                            <div class="field">
                                                <label for="descripcion">Descripcion</label>
                                                <textarea name="descripcion" id="descripcion" required><% if (id !=null) {%> <%=servi.getDescripcionBreve()%> <% } %></textarea>
                                            </div>
                                            <% if (id !=null) {%>
                                                <input type=" hidden" name="id" value="<%=servi.getCodigo()%>">
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