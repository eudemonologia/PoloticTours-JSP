package Servlets;

import Logica.Controladora;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvServicio", urlPatterns = {"/SvServicio"})
public class SvServicio extends HttpServlet {
    
    Controladora control = new Controladora();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            
            String nombre = request.getParameter("name");
            String descripcionBreve = request.getParameter("descripcion");
            String destino = request.getParameter("destino");
            double costo = Double.parseDouble(request.getParameter("costo"));
            
            Date fecha = format.parse(request.getParameter("fecha"));
            
            boolean creado = control.crearServicio(nombre, descripcionBreve, destino, costo, fecha);
            
            if (creado) {
                response.sendRedirect("servicios.jsp?creado=true");
            } else {
                response.sendRedirect("servicios.jsp?creado=false");
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(SvServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
