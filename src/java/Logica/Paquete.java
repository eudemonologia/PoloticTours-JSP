package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Paquete implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo;
    @Basic
    private String nombre;
    private int descuento;
    @ManyToMany
    private List<Servicio> listaServicios;
    @ManyToMany
    private List<Venta> listaVentas;

    public Paquete() {
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDescuento() {
        return descuento;
    }

    public List<Servicio> getListaServicios() {
        return listaServicios;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    public void setListaServicios(List<Servicio> listaServicios) {
        this.listaServicios = listaServicios;
    }
    
    public void addListaServicios(Servicio servicio){
        this.listaServicios.add(servicio);
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }
    
    
    
    
}
