package Servlets;

import Logica.Controladora;
import Persistencia.exceptions.NonexistentEntityException;
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

@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("DELETE")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean eliminado = control.eliminarEmpleado(id);
                if (eliminado) {
                    response.sendRedirect("empleados.jsp?eliminado=true");
                } else {
                    response.sendRedirect("empleados.jsp?eliminado=false");
                }
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("UPDATE")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("name");
                String apellido = request.getParameter("lastname");
                String dni = request.getParameter("dni");
                String email = request.getParameter("email");
                String celular = request.getParameter("phone");
                String direccion = request.getParameter("address");
                String nacionalidad = request.getParameter("nationality");

                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

                Date fechaNac = format.parse(request.getParameter("birthdate"));

                Date fechaContratacion = format.parse(request.getParameter("admissiondate"));

                String cargo = request.getParameter("position");
                double sueldo = Double.parseDouble(request.getParameter("salary"));

                String password = request.getParameter("password");
                
                boolean actualizado = control.updateEmpleado(id, nombre, apellido, dni, email, celular, direccion, nacionalidad, fechaNac, fechaContratacion, cargo, sueldo, password);
                
                if (actualizado) {
                    response.sendRedirect("empleados.jsp?actualizado=true");
                } else {
                    response.sendRedirect("empleados.jsp?actualizado=false");
                }
                
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else {
            try {

                String nombre = request.getParameter("name");
                String apellido = request.getParameter("lastname");
                String dni = request.getParameter("dni");
                String email = request.getParameter("email");
                String celular = request.getParameter("phone");
                String direccion = request.getParameter("address");
                String nacionalidad = request.getParameter("nationality");

                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

                Date fechaNac = format.parse(request.getParameter("birthdate"));

                Date fechaContratacion = format.parse(request.getParameter("admissiondate"));

                String cargo = request.getParameter("position");
                double sueldo = Double.parseDouble(request.getParameter("salary"));

                String password = request.getParameter("password");

                control.crearEmpleado(nombre, apellido, dni, email, celular, direccion, nacionalidad, fechaNac, fechaContratacion, cargo, sueldo, password);
                response.sendRedirect("empleados.jsp");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
