package Modelo.Interface;

import java.util.List;

public interface dsaborcomCRUD {

    public List listar();

    public int agregar(Object[] o);

    public int actualizar(Object[] o);

    public void eliminar(int cod);
}
