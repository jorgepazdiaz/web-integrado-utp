package Modelo.Entidad;

import java.io.Serializable;

public class Receta implements Serializable{
     int idReceta;
     String Nombre;
     int idUsuario;
     String Usuario;
     int idTipoComida;
     String TipoComida;
     String Foto;
     String LinkReceta;
     String Estado;
     double Precio;

    public Receta() {
    }

    public Receta(int idReceta, String Nombre, int idUsuario, String Usuario, int idTipoComida, String TipoComida, String Foto, String LinkReceta, String Estado, double Precio) {
        this.idReceta = idReceta;
        this.Nombre = Nombre;
        this.idUsuario = idUsuario;
        this.Usuario = Usuario;
        this.idTipoComida = idTipoComida;
        this.TipoComida = TipoComida;
        this.Foto = Foto;
        this.LinkReceta = LinkReceta;
        this.Estado = Estado;
        this.Precio = Precio;
    }

    public int getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(int idReceta) {
        this.idReceta = idReceta;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public int getIdTipoComida() {
        return idTipoComida;
    }

    public void setIdTipoComida(int idTipoComida) {
        this.idTipoComida = idTipoComida;
    }

    public String getTipoComida() {
        return TipoComida;
    }

    public void setTipoComida(String TipoComida) {
        this.TipoComida = TipoComida;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getLinkReceta() {
        return LinkReceta;
    }

    public void setLinkReceta(String LinkReceta) {
        this.LinkReceta = LinkReceta;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
    
    

}