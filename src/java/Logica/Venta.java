package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;

@Entity
public class Venta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo;
    @Basic
    private double costo;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fechaVenta;
    @ManyToMany
    private List <Paquete> listaPacks;

    public Venta() {
    }

    public int getCodigo() {
        return codigo;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public double getCosto() {
        return costo;
    }

    public List<Paquete> getListaPacks() {
        return listaPacks;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void addListaPacks(Paquete paquete) {
        this.listaPacks.add(paquete);
    }

    public void setListaPacks(List<Paquete> listaPacks) {
        this.listaPacks = listaPacks;
    }
    
    
    
}
