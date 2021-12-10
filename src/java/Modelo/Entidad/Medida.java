package Modelo.Entidad;

public class Medida {
    int cod;
    String nom;
    String pref;

    public Medida() {
    }

    public Medida(int cod, String nom, String pref) {
        this.cod = cod;
        this.nom = nom;
        this.pref = pref;
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

    public String getPref() {
        return pref;
    }

    public void setPref(String pref) {
        this.pref = pref;
    }
}
