package Modelo.Entidad;

public class Insumo {
    int cod;
    String nom;
    int codCat;
    String categoria;
    int codMed;
    String medida;
    double precio;

    public Insumo() {
    }

    public Insumo(int cod, String nom, int codCat, String categoria, int codMed, String medida, double precio) {
        this.cod = cod;
        this.nom = nom;
        this.codCat = codCat;
        this.categoria = categoria;
        this.codMed = codMed;
        this.medida = medida;
        this.precio = precio;
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

    public int getCodCat() {
        return codCat;
    }

    public void setCodCat(int codCat) {
        this.codCat = codCat;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCodMed() {
        return codMed;
    }

    public void setCodMed(int codMed) {
        this.codMed = codMed;
    }

    public String getMedida() {
        return medida;
    }

    public void setMedida(String medida) {
        this.medida = medida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
