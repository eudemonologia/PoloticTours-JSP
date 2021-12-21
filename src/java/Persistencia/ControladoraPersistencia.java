package Persistencia;

import Logica.Cliente;
import Logica.Empleado;
import Logica.MedioPago;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;

public class ControladoraPersistencia {
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    ClienteJpaController clienteJPA = new ClienteJpaController();
    MedioPagoJpaController medioJPA = new MedioPagoJpaController();

    public void crearEmpleado(Empleado emple, Usuario usu) {
        usuJPA.create(usu);
        empleJPA.create(emple);
    }

    public List<Empleado> traerEmpleados() {
        return empleJPA.findEmpleadoEntities();
    }

    public Empleado traerEmpleado(int id) {
        return empleJPA.findEmpleado(id);
    }

    public List<Usuario> traerUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public List<Cliente> traerClientes() {
        return  clienteJPA.findClienteEntities();
    }

    public Cliente traerCliente(int id) {
        return clienteJPA.findCliente(id);
    }

    public boolean eliminarEmpleado(int id) throws NonexistentEntityException {
            empleJPA.destroy(id);
            return true;
    }

    public boolean eliminarUsuario(int id) throws NonexistentEntityException {

            usuJPA.destroy(id);
            return true;
    }

    public void crearCliente(Cliente cliente) {
        clienteJPA.create(cliente);
    }

    public List<MedioPago> traerMedios() {
        return medioJPA.findMedioPagoEntities();
    }
    
}
