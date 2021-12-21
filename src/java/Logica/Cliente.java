package Logica;


import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable {

    @OneToMany
    private List<Venta> listaCompras;

    public Cliente() {
    }

    public List<Venta> getListaCompras() {
        return listaCompras;
    }


    public void addListaCompras(Venta compra) {
        this.listaCompras.add(compra);
    }

    public void setListaCompras(List<Venta> listaCompras) {
        this.listaCompras = listaCompras;
    }
    
    
}
