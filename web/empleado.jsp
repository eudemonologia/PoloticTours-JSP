<%@page import="java.text.SimpleDateFormat" %>
    <%@page import="Logica.Controladora" %>
        <%@page import="Logica.Empleado" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <% HttpSession miSesion=request.getSession(); if (miSesion.getAttribute("usuario")==null) { response.sendRedirect("login.jsp"); } %>
                    <% String id=request.getParameter("id"); String nombre=request.getParameter("name"); Empleado emple=null; if (id !=null && nombre !=null) { Controladora control=new Controladora(); emple=control.traerEmpleado(Integer.parseInt(id)); }%>
                        <% SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");%>
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
                                                <% if (id !=null) {%>
                                                    <%= emple.getNombre()%>
                                                        <%=emple.getApellido()%>
                                                            <% } else { %> Nuevo Empleado <% } %>
                                            </h2>
                                            <section class="card">
                                                <form class="form colums2" action="SvEmpleado" method="POST">
                                                    <div class="field">
                                                        <label for="name">Nombre</label>
                                                        <input type="text" name="name" id="name" <% if (id !=null) {%> value="<%=emple.getNombre()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="lastname">Apellido</label>
                                                        <input type="text" name="lastname" id="lastname" <% if (id !=null) {%> value="<%=emple.getApellido()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="dni">DNI</label>
                                                        <input type="text" name="dni" id="dni" <% if (id !=null) {%> value="<%=emple.getDni()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="">Email</label>
                                                        <input type="email" name="email" id="email" <% if (id !=null) {%> value="<%=emple.getEmail()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="password">Contraseña</label>
                                                        <input type="password" name="password" id="password" <% if (id !=null) {%> value="<%=emple.getUsuario().getPassword()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="phone">Teléfono</label>
                                                        <input type="tel" name="phone" id="phone" <% if (id !=null) {%> value="<%=emple.getCelular()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="address">Dirección</label>
                                                        <input type="text" name="address" id="address" <% if (id !=null) {%> value="<%=emple.getDireccion()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="nationality">Nacionalidad</label>
                                                        <input type="text" name="nationality" id="nationality" <% if (id !=null) {%> value="<%=emple.getNacionalidad()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="birthdate">Fecha de nacimiento</label>
                                                        <input type="date" name="birthdate" id="birthdate" <% if (id !=null) {%> value="<%=format.format(emple.getFechaNac())%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="admissiondate">Fecha de ingreso</label>
                                                        <input type="date" name="admissiondate" id="admissiondate" <% if (id !=null) {%> value="<%=format.format(emple.getFechaContratacion())%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="position">Puesto</label>
                                                        <input type="text" name="position" id="position" <% if (id !=null) {%> value="<%=emple.getCargo()%>" <% } %> required>
                                                    </div>
                                                    <div class="field">
                                                        <label for="salary">Salario</label>
                                                        <input type="number" name="salary" id="salary" <% if (id !=null) {%> value="<%= emple.getSueldo()%>" <% }%> required>
                                                    </div>
                                                    <% if (id !=null) {%>
                                                        <input type="hidden" name="id" value="<%=emple.getId()%>">
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