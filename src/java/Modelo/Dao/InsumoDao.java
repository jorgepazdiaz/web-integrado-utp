package Modelo.Dao;

import Configuracion.Conexion;
import Modelo.Entidad.Insumo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import Modelo.Interface.dsaborcomCRUD;

/*
 * 
 */
public class InsumoDao implements dsaborcomCRUD{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Insumo listarId(int cod) {
        Insumo ins = new Insumo();
        String sql = "select * from insumo where idInsumo=" + cod;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ins.setCod(rs.getInt(1));
                ins.setNom(rs.getString(2));
                ins.setCodCat(rs.getInt(3));
                ins.setCodMed(rs.getInt(4));
                ins.setPrecio(rs.getDouble(5));
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
        return ins;
    }
    
    @Override
    public List listar() {
        String sql = "SELECT idInsumo, nombreInsumo,categoria.nombre, medida.nombre, precio FROM insumo INNER JOIN categoria ON insumo.idCategoria = categoria.idCategoria INNER JOIN medida ON insumo.idMedida = medida.idmedida ORDER BY idInsumo";
        List<Insumo> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Insumo ins = new Insumo();
                ins.setCod(rs.getInt(1));
                ins.setNom(rs.getString(2));
                ins.setCategoria(rs.getString(3));
                ins.setMedida(rs.getString(4));
                ins.setPrecio(rs.getDouble(5));
                lista.add(ins);
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
        String sql = "insert into insumo(nombreInsumo, idCategoria, idMedida, precio)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
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
        String sql = "update insumo set nombreInsumo=?, idCategoria=?, idMedida=?, precio=? where idInsumo=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
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
        String sql = "delete from insumo where idInsumo=" + cod;
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