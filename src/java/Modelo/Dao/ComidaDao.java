package Modelo.Dao;
import Configuracion.Conexion;
import Modelo.Entidad.Comida;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import Modelo.Interface.dsaborcomCRUD;


public class ComidaDao implements dsaborcomCRUD{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public Comida listarId(int cod) {
        Comida com = new Comida();
        String sql = "select * from  tipocomida where idTipoComida=" + cod;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                com.setCod(rs.getInt(1));
                com.setNom(rs.getString(2));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
            }
        }
        return com;
    }
   @Override
    public List listar() {
        String sql = "select * from  tipocomida order by idTipoComida";
        List<Comida> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comida cat = new Comida();
                cat.setCod(rs.getInt(1));
                cat.setNom(rs.getString(2));
                lista.add(cat);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);        
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);    
                }
            }
        }
        return lista;
    }

    @Override
    public int agregar(Object[] o) {
        String sql = "insert into tipocomida(nombre)values(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setObject(1, o[0]);
            r = ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);        
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);    
                }
            }
        }
        return r;
    }

    @Override
    public int actualizar(Object[] o) {
        String sql = "update tipocomida set nombre=? where idTipoComida=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            r = ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);        
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);    
                }
            }
        }
        return r;
    }

    @Override
    public void eliminar(int cod) {
        String sql = "delete from tipocomida where idTipoComida=" + cod;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);        
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);    
                }
            }
        }
    }
}
