package Modelo.Entidad;

public class Categoria {
    int cod;
    String nom;

    public Categoria() {
    }

    public Categoria(int cod, String nom) {
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
