package Persistencia;

import Logica.Cliente;
import Logica.Empleado;
import Logica.MedioPago;
import Logica.Paquete;
import Logica.Servicio;
import Logica.Usuario;
import Logica.Venta;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    ClienteJpaController clienteJPA = new ClienteJpaController();
    MedioPagoJpaController medioJPA = new MedioPagoJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();
    ServicioJpaController serviJPA = new ServicioJpaController();
    PaqueteJpaController paqueJPA = new PaqueteJpaController();

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
        return clienteJPA.findClienteEntities();
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

    public boolean updateEmpleado(Empleado emple, Usuario usu) {
        boolean actualizado = false;
        try {
            usuJPA.edit(usu);
            empleJPA.edit(emple);
            actualizado = true;
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actualizado;
    }

    public List<Venta> traerVentas() {
        return ventaJPA.findVentaEntities();
    }

    public boolean updateCliente(Cliente cliente) {
        boolean actualizado = false;
        try {
            clienteJPA.edit(cliente);
            actualizado = true;
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actualizado;
    }

    public boolean eliminarCliente(int id) {
        boolean eliminado = false;
        try {
            clienteJPA.destroy(id);
            eliminado = true;
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eliminado;
    }

    public MedioPago traerMedio(int id) {
        return medioJPA.findMedioPago(id);
    }

    public boolean crearMedio(MedioPago medio) {
        medioJPA.create(medio);
        return true;
    }

    public boolean updateMedio(MedioPago medio) {
        boolean actualizado = false;
        try {
            medioJPA.edit(medio);
            actualizado = true;
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actualizado;
    }

    public boolean eliminarMedio(int id) {
        boolean eliminado = false;
        try {
            medioJPA.destroy(id);
            eliminado = true;
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eliminado;
    }
    
    public Servicio traerServicio(int id){
        return serviJPA.findServicio(id);
    }
    
    public boolean crearServicio(Servicio servi, Paquete paque){
        serviJPA.create(servi);
        paqueJPA.create(paque);
        return true;
    }
}
