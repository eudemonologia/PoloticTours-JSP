package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class MedioPago implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo;
    @Basic
    private String nombre;
    private int comision;
    @OneToMany
    private List <Cliente> favoritoDe;
    @OneToMany
    private List <Venta> utilizadoEn;

    public MedioPago() {
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public int getComision() {
        return comision;
    }

    public List<Cliente> getFavoritoDe() {
        return favoritoDe;
    }

    public List<Venta> getUtilizadoEn() {
        return utilizadoEn;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setComision(int comision) {
        this.comision = comision;
    }

    public void setFavoritoDe(List<Cliente> favoritoDe) {
        this.favoritoDe = favoritoDe;
    }

    public void setUtilizadoEn(List<Venta> utilizadoEn) {
        this.utilizadoEn = utilizadoEn;
    }
    
    
    
}
