package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvMedio", urlPatterns = {"/SvMedio"})
public class SvMedio extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action.equals("UPDATE")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("name");
            int comision = Integer.parseInt(request.getParameter("interest"));

            boolean actualizado = control.updateMedio(id, nombre, comision);

            if (actualizado) {
                response.sendRedirect("medios.jsp?actualizado=true");
            } else {
                response.sendRedirect("medios.jsp?actualizado=false");
            }

        } else {

            String nombre = request.getParameter("name");
            int comision = Integer.parseInt(request.getParameter("interest"));

            boolean creado = control.crearMedio(nombre, comision);

            if (creado) {
                response.sendRedirect("medios.jsp?creado=true");
            } else {
                response.sendRedirect("medios.jsp?creado=false");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
