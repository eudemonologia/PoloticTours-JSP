<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% String error=request.getParameter("error"); %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <%@include file="COMPONENTS/Head.jsp" %>
                <link rel="stylesheet" href="./CSS/login.css">
        </head>

        <body class="login">
            <header>
                <h1 class="logo">polo<span>tic</span> tours</h1>
            </header>
            <main class="card">
                <% if(error !=null) { %>
                    <p class="error">
                       Usuario o contraseña equivocadas.
                    </p>
                    <% } %>
                        <form class="form" action="SvUsuario" method="POST">
                            <div class="field">
                                <label for="">Email: </label>
                                <input type="email" name="email" id="email" required>
                            </div>
                            <div class="field">
                                <label for="">Contraseña</label>
                                <input type="password" name="password" id="password" required>
                            </div>
                            <button type="submit">
                                <span class="material-icons-sharp">
                                    lock_open
                                </span>
                                Iniciar sesión
                            </button>
                            <small>
                                <a href="">¿No tienes cuenta? Regístrate</a>
                            </small>
                        </form>
            </main>
        </body>

        </html>