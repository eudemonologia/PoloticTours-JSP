package Logica;

import Persistencia.ControladoraPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.Date;
import java.util.List;


public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public List<Empleado> traerEmpleados(){
        return controlPersis.traerEmpleados();
    }
    
    public Empleado traerEmpleado(int id){
        return controlPersis.traerEmpleado(id);
    } 

    public void crearEmpleado(String nombre, String apellido, String dni, String email, String celular, String direccion, String nacionalidad, Date fechaNac, Date fechaContratacion, String cargo, double sueldo, String password) {
       Empleado emple = new Empleado();
       Usuario usu = new Usuario();
       
       emple.setNombre(nombre);
       emple.setApellido(apellido);
       emple.setDni(dni);
       emple.setEmail(email);
       emple.setCelular(celular);
       emple.setDireccion(direccion);
       emple.setNacionalidad(nacionalidad);
       emple.setFechaNac(fechaNac);
       
       emple.setFechaContratacion(fechaContratacion);
       emple.setCargo(cargo);
       emple.setSueldo(sueldo);
       
       
       usu.setUsuario(email);
       usu.setPassword(password);
       
       emple.setUsuario(usu);
       
       controlPersis.crearEmpleado(emple, usu);
    }

    public boolean conectarUsuario(String email, String password) {
        List <Usuario> listaUsuarios = controlPersis.traerUsuarios();
        
        if (listaUsuarios != null){
            for (Usuario usu : listaUsuarios){
                if (usu.getUsuario().equals(email) && usu.getPassword().equals(password)){
                    return true;
                }
            }
        }
        return false;
    }

    public boolean eliminarEmpleado(int id) throws NonexistentEntityException {
        Empleado emple = controlPersis.traerEmpleado(id);
        int idUsu = emple.getUsuario().getCodigo();
        boolean eliminado = controlPersis.eliminarEmpleado(id);
        eliminado = controlPersis.eliminarUsuario(idUsu);
        return eliminado;
    }

    public Empleado traerEmpleadoByEmail(String email) {
        List <Empleado> listaEmpleados = controlPersis.traerEmpleados();
        
        if (listaEmpleados != null){
            for (Empleado emple : listaEmpleados){
                if (emple.getEmail().equals(email)){
                    return emple;
                }
            }
        }
        return null;
    }
    
    public List <Cliente> traerClientes(){
        return controlPersis.traerClientes();
    }
    
    public Cliente traerCliente(int id){
        return controlPersis.traerCliente(id);
    }

    public void crearCliente(String nombre, String apellido, String dni, String email, String celular, String direccion, String nacionalidad, Date fechaNac) {
        
        Cliente cliente = new Cliente();
        
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDni(dni);
        cliente.setEmail(email);
        cliente.setCelular(celular);
        cliente.setDireccion(direccion);
        cliente.setNacionalidad(nacionalidad);
        cliente.setFechaNac(fechaNac);
        
        controlPersis.crearCliente(cliente);
    }
    
    public List <MedioPago> traerMedios(){
        return controlPersis.traerMedios();
    }

    public boolean updateEmpleado(int id, String nombre, String apellido, String dni, String email, String celular, String direccion, String nacionalidad, Date fechaNac, Date fechaContratacion, String cargo, double sueldo, String password) {
        Empleado emple = controlPersis.traerEmpleado(id);
        Usuario usu = emple.getUsuario();
        
        
        
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setDni(dni);
        emple.setEmail(email);
        emple.setCelular(celular);
        emple.setDireccion(direccion);
        emple.setNacionalidad(nacionalidad);
        emple.setFechaNac(fechaNac);
        
        emple.setFechaContratacion(fechaContratacion);
        emple.setCargo(cargo);
        emple.setSueldo(sueldo);
        
        usu.setUsuario(email);
        usu.setPassword(password);
        
        boolean actualizado = true;
        return actualizado;
    }
}
