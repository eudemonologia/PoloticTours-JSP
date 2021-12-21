package Logica;

import java.util.Date;

/**
 *
 * @author Cristian Diego Góngora Pabón
 */
public class Principal {

    public static void main(String[] args) {
        Date fecha_actual = new Date();
        Empleado cristian = new Empleado();
        cristian.setNombre("Cristian Diego");
        cristian.setApellido("Góngora Pabón");
        System.out.println(cristian.getNombre()+ " " + cristian.getApellido());
    }
    
}
