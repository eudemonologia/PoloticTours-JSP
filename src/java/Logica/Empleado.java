package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

@Entity
public class Empleado extends Persona implements Serializable {

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fechaContratacion;
    @Basic
    private String cargo;
    private double sueldo;
    @OneToOne
    private Usuario usuario;
    @OneToMany
    private List<Venta> listaVentas;

    public Empleado() {
    }

    public String getCargo() {
        return cargo;
    }

    public Date getFechaContratacion() {
        return fechaContratacion;
    }

    public double getSueldo() {
        return sueldo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public void setFechaContratacion(Date fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }

    public void addListaVentas(Venta venta) {
        this.listaVentas.add(venta);
    }
    
    
}
