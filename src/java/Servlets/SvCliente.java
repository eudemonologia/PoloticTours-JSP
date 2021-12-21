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

@WebServlet(name = "SvCliente", urlPatterns = {"/SvCliente"})
public class SvCliente extends HttpServlet {

    Controladora control = new Controladora();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

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
        if (action.equals("DELETE")){
            int id = Integer.parseInt(request.getParameter("id"));
            
            boolean eliminado = control.eliminarCliente(id);
            request.getSession().setAttribute("listaClientes", control.traerClientes());
            
            if (eliminado) {
                    response.sendRedirect("clientes.jsp?eliminado=true");
                } else {
                    response.sendRedirect("clientes.jsp?eliminado=false");
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
                
                Date fechaNac = format.parse(request.getParameter("birthdate"));
                
                boolean actualizado = control.updateCliente(id, nombre, apellido, dni, email, celular, direccion, nacionalidad, fechaNac);
                request.getSession().setAttribute("listaClientes", control.traerClientes());
                
                if (actualizado) {
                    response.sendRedirect("clientes.jsp?actualizado=true");
                } else {
                    response.sendRedirect("clientes.jsp?actualizado=false");
                }
                
            } catch (ParseException ex) {
                Logger.getLogger(SvCliente.class.getName()).log(Level.SEVERE, null, ex);
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


                Date fechaNac = format.parse(request.getParameter("birthdate"));

                control.crearCliente(nombre, apellido, dni, email, celular, direccion, nacionalidad, fechaNac);
                request.getSession().setAttribute("listaClientes", control.traerClientes());
                
                response.sendRedirect("clientes.jsp");
            } catch (ParseException ex) {
                Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
