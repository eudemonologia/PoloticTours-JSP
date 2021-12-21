package Servlets;

import Logica.Controladora;
import Logica.Empleado;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession miSesion = request.getSession();
        miSesion.invalidate();
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean autorizado = control.conectarUsuario(email, password);

        if (autorizado) {
            Empleado emple = control.traerEmpleadoByEmail(email);
            HttpSession miSesion = request.getSession(true);
            miSesion.setAttribute("usuario", email);
            miSesion.setAttribute("nombre", emple.getNombre());
            miSesion.setAttribute("apellido", emple.getApellido());
            miSesion.setAttribute("password", password);

            miSesion.setAttribute("listaVentas", control.traerVentas());
            miSesion.setAttribute("listaEmpleados", control.traerEmpleados());
            miSesion.setAttribute("listaClientes", control.traerClientes());
            miSesion.setAttribute("listaMedios", control.traerMedios());
            response.sendRedirect("index.jsp");

        } else {
            response.sendRedirect("login.jsp?error=no+credentials");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
