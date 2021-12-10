package Modelo.Entidad;

import java.io.Serializable;

public class Comida {
    private int cod ;
    private String nom ;

    public Comida() {
    }

    public Comida(int cod, String nom) {
        this.cod = cod;
        this.nom = nom;
    }
    
    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
