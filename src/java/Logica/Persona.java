package Logica;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;

@MappedSuperclass
public abstract class Persona {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Basic
    private String nombre;
    private String apellido;
    private String direccion;
    private String dni;
    private String nacionalidad;
    private String celular;
    private String email;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fechaNac;


    public Persona() {
    }

    public Persona(int id, String nombre, String apellido, String direccion, String dni, Date fecha_nac, String nacionalidad, String celular, String email) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.dni = dni;
        this.fechaNac = fecha_nac;
        this.nacionalidad = nacionalidad;
        this.celular = celular;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getDni() {
        return dni;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public String getCelular() {
        return celular;
    }

    public String getEmail() {
        return email;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setFechaNac(Date fecha_nac) {
        this.fechaNac = fecha_nac;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

}
