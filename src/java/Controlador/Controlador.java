package Controlador;
import Modelo.Dao.CategoriaDao;
import Modelo.Dao.ComidaDao;
import Modelo.Dao.InsumoDao;
import Modelo.Dao.MedidaDao;
import Modelo.Dao.RecetaDao;
import Modelo.Dao.UsuarioDAO;
import Modelo.Entidad.Categoria;
import Modelo.Entidad.Comida;
import Modelo.Entidad.Insumo;
import Modelo.Entidad.Medida;
import Modelo.Entidad.Receta;
import Modelo.Entidad.Usuario;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Controlador extends HttpServlet {
    
    Categoria cat = new Categoria();
    CategoriaDao catdao = new CategoriaDao();
    Comida com = new Comida();
    ComidaDao comdao = new ComidaDao();
    Medida medida = new Medida();
    MedidaDao medao = new MedidaDao();
    Insumo insumo = new Insumo();
    InsumoDao insdao = new InsumoDao();
    Receta receta = new Receta();
    RecetaDao rectdao = new RecetaDao();
    Usuario usuario = new Usuario();
    UsuarioDAO userdao = new UsuarioDAO();
    static final double igv = 0.18;
    String numComprobante;
    int codProveedor;
    Date fechaCompra;
    double precioTransporte;
    int item;
    int cod;
    String numSerie;
    String descripcion;
    double precio;
    int cant;
    int medidaProducto;
    int marca;
    int categoria;
    int comprobante;
    double precioCompra;
    double precioVenta;
    double subtotal;
    double igvCompra;
    double subtotalCompra;
    double totalPagar;
    String flag;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String check = request.getParameter("check");
        
       
        if (menu.equals("Home")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        if (menu.equals("Organizar")) {
            if (accion.equals("Listar")) {
                List listaRecetas = rectdao.listar();
                List listaComidas = comdao.listar();
                String[] listCategorias = null;
         
                request.setAttribute("recetas", listaRecetas);
                request.setAttribute("comidas", listaComidas);
                request.setAttribute("listCategorias", listCategorias);
                
                request.getRequestDispatcher("Vista/Genericos/OrganizarMenu.jsp").forward(request, response);
            }
        }
        if (menu.equals("SeleccionarMenu")) {
            
            if (accion.equals("Listar")) {
                List listaReceta = rectdao.listar();
                List listaComidas = comdao.listar();
                request.setAttribute("recetas", listaReceta);
                request.setAttribute("comidas", listaComidas);
                request.getRequestDispatcher("Vista/Genericos/SeleccionarReceta.jsp").forward(request, response);
            }
        }
        if (menu.equals("/Vista/Genericos/SeleccionarMenuSubmit")) {
            
            if (accion.equals("Listar")) {
                List listaReceta = rectdao.listar();
                List listaComidas = comdao.listar();
                request.setAttribute("recetas", listaReceta);
                request.setAttribute("comidas", listaComidas);
                request.getRequestDispatcher("Vista/Genericos/SeleccionarReceta.jsp").forward(request, response);
            }
        }
        if (menu.equals("Detalle")) {
            if (accion.equals("Listar")) {
                List listaReceta = rectdao.listar();
                List listaComidas = comdao.listar();
                request.setAttribute("receta", listaReceta);
                request.setAttribute("comidas", listaComidas);
                request.getRequestDispatcher("Vista/Genericos/DetallePresupuesto.jsp").forward(request, response);
            }
        }
        
        if (menu.equals("Categorias")) {
            if (accion.equals("Listar")) {
                List listaCategorias = catdao.listar();
                request.setAttribute("categorias", listaCategorias);
                request.getRequestDispatcher("Vista/Mantenimiento/Categorias.jsp").forward(request, response);
            } else {
                switch (accion) {
                    case "AgregarCategoria":
                        String categoria = request.getParameter("txtCategoria");
                        Object[] obCat = new Object[1];
                        obCat[0] = categoria;
                        catdao.agregar(obCat);
                        flag = "CAT";
                        request.setAttribute("flag", flag);
                        request.getRequestDispatcher("Controlador?menu=Categorias&accion=Listar").forward(request, response);
                        break;
                    case "EditarCategoria":
                        int idCatEdit = Integer.parseInt(request.getParameter("cod"));
                        Categoria catEditar = catdao.listarId(idCatEdit);
                        request.setAttribute("categoria", catEditar);
                        request.getRequestDispatcher("Controlador?menu=Categorias&accion=Listar").forward(request, response);
                        break;
                    case "ActualizarCategoria":
                        String categoriaUp = request.getParameter("txtCategoria");
                        String codCatUp = request.getParameter("txtCod");
                        Object[] obCatUp = new Object[2];
                        obCatUp[0] = categoriaUp;
                        obCatUp[1] = codCatUp;
                        catdao.actualizar(obCatUp);
                        request.getRequestDispatcher("Controlador?menu=Categorias&accion=Listar").forward(request, response);
                        break;
                    case "EliminarCategoria":
                        int idCatElim = Integer.parseInt(request.getParameter("cod"));
                        catdao.eliminar(idCatElim);
                        request.getRequestDispatcher("Controlador?menu=Categorias&accion=Listar").forward(request, response);
                        break;
                    default:
                        Exception e;
                        break;
                }
            }
        }
        
        if (menu.equals("Comidas")) {
            if (accion.equals("Listar")) {
                List listaComidas = comdao.listar();
                request.setAttribute("comidas", listaComidas);
                request.getRequestDispatcher("Vista/Mantenimiento/Comidas.jsp").forward(request, response);
            } else {
                switch (accion) {
                    case "AgregarComida":
                        String comida = request.getParameter("txtComida");
                        Object[] obCom = new Object[1];
                        obCom[0] = comida;
                        comdao.agregar(obCom);
                        flag = "COM";
                        request.setAttribute("flag", flag);
                        request.getRequestDispatcher("Controlador?menu=Comidas&accion=Listar").forward(request, response);
                        break;
                    case "EditarComida":
                        int idComEdit = Integer.parseInt(request.getParameter("cod"));
                        Comida comEditar = comdao.listarId(idComEdit);
                        request.setAttribute("comida", comEditar);
                        request.getRequestDispatcher("Controlador?menu=Comidas&accion=Listar").forward(request, response);
                        break;
                    case "ActualizarComida":
                        String comidaUp = request.getParameter("txtComida");
                        String codComUp = request.getParameter("txtCod");
                        Object[] obComUp = new Object[2];
                        obComUp[0] = comidaUp;
                        obComUp[1] = codComUp;
                        comdao.actualizar(obComUp);
                        request.getRequestDispatcher("Controlador?menu=Comidas&accion=Listar").forward(request, response);
                        break;
                    case "EliminarComida":
                        int idCatElim = Integer.parseInt(request.getParameter("cod"));
                        comdao.eliminar(idCatElim);
                        request.getRequestDispatcher("Controlador?menu=Comidas&accion=Listar").forward(request, response);
                        break;
                    default:
                        Exception e;
                        break;
                }
            }
        }
        
        if (menu.equals("Insumos")) {
            if (accion.equals("Listar")) {
                List listaInsumos = insdao.listar();
                List listaMedidas = medao.listar();
                List listaCategorias = catdao.listar();
                request.setAttribute("insumos", listaInsumos);
                request.setAttribute("medidas", listaMedidas);
                request.setAttribute("categorias", listaCategorias);
                request.getRequestDispatcher("Vista/Mantenimiento/Insumos.jsp").forward(request, response);
            } else {
                switch (accion) {
                    case "Agregar":
                        String nom = request.getParameter("txtnom");
                        int categ = Integer.parseInt(request.getParameter("cboCategoria"));
                        int med = Integer.parseInt(request.getParameter("cboMedida"));
                        double prec = Double.parseDouble(request.getParameter("txtprecio"));
                        Object[] obIns = new Object[4];
                        obIns[0] = nom;
                        obIns[1] = categ;
                        obIns[2] = med;
                        obIns[3] = prec;
                        insdao.agregar(obIns);
                        flag = "INS";
                        request.setAttribute("flag", flag);
                        request.getRequestDispatcher("Controlador?menu=Insumos&accion=Listar").forward(request, response);
                        break;
                    case "Editar":
                        int idInsEdit = Integer.parseInt(request.getParameter("cod"));
                        Insumo insEditar = insdao.listarId(idInsEdit);
                        request.setAttribute("insumo", insEditar);
                        request.getRequestDispatcher("Controlador?menu=Insumos&accion=Listar").forward(request, response);
                        break;
                    case "Actualizar":
                        String nomUp = request.getParameter("txtnom");
                        int categUp = Integer.parseInt(request.getParameter("cboCategoria"));
                        int medUp = Integer.parseInt(request.getParameter("cboMedida"));
                        double precUp = Double.parseDouble(request.getParameter("txtprecio"));
                        String codUp = request.getParameter("txtCod");
                        Object[] obInsUp = new Object[5];
                        obInsUp[0] = nomUp;
                        obInsUp[1] = categUp;
                        obInsUp[2] = medUp;
                        obInsUp[3] = precUp;
                        obInsUp[4] = codUp;
                        insdao.actualizar(obInsUp);
                        request.getRequestDispatcher("Controlador?menu=Insumos&accion=Listar").forward(request, response);
                        break;
                    case "Eliminar":
                        int idProElim = Integer.parseInt(request.getParameter("cod"));
                        insdao.eliminar(idProElim);
                        request.getRequestDispatcher("Controlador?menu=Insumos&accion=Listar").forward(request, response);
                        break;
                    default:
                        Exception e;
                        break;
                }
            }
        }
        
        if (menu.equals("Recetas")) {
            if (accion.equals("Listar")) {
                List listaReceta = rectdao.listar();
                List listaComidas = comdao.listar();
                request.setAttribute("receta", listaReceta);
                request.setAttribute("comidas", listaComidas);
                request.getRequestDispatcher("Vista/Mantenimiento/Receta.jsp").forward(request, response);
            } else {
                switch (accion) {
                    case "Agregar":
                        String nom = request.getParameter("txtnom");
                        String usuario = request.getParameter("txtuser");
                        int comida = Integer.parseInt(request.getParameter("cboComidas"));
                        String foto = request.getParameter("txtfoto");
                        String link = request.getParameter("txtlink");
                        String estado = request.getParameter("cboEstado");
                        String precio = request.getParameter("txtprecio");
                        Object[] obRect = new Object[7];
                        obRect[0] = nom;
                        obRect[1] = usuario;
                        obRect[2] = comida;
                        obRect[3] = foto;
                        obRect[4] = link;
                        obRect[5] = estado;
                        obRect[6] = precio;
                        rectdao.agregar(obRect);
                        flag = "RECT";
                        request.setAttribute("flag", flag);
                        request.getRequestDispatcher("Controlador?menu=Recetas&accion=Listar").forward(request, response);
                        break;
                    case "Editar":
                        int idRectEdit = Integer.parseInt(request.getParameter("cod"));
                        Receta RectEditar = rectdao.listarId(idRectEdit);
                        request.setAttribute("receta", RectEditar);
                        request.getRequestDispatcher("Controlador?menu=Recetas&accion=Listar").forward(request, response);
                        break;
                    case "Actualizar":
                        String nomup = request.getParameter("txtnom");
                        int comidaup = Integer.parseInt(request.getParameter("cboComidas"));
                        String fotoup = request.getParameter("txtfoto");
                        String linkup = request.getParameter("txtlink");
                        int estadoup = Integer.parseInt(request.getParameter("cboEstado"));
                        String codUp = request.getParameter("txtCod");
                        Object[] obRectUp = new Object[6];
                        obRectUp[0] = nomup;
                        obRectUp[1] = comidaup;
                        obRectUp[2] = fotoup;
                        obRectUp[3] = linkup;
                        obRectUp[3] = estadoup;
                        obRectUp[4] = codUp;
                        rectdao.actualizar(obRectUp);
                        request.getRequestDispatcher("Controlador?menu=Recetas&accion=Listar").forward(request, response);
                        break;
                    case "Eliminar":
                        int idProElim = Integer.parseInt(request.getParameter("cod"));
                        rectdao.eliminar(idProElim);
                        request.getRequestDispatcher("Controlador?menu=Recetas&accion=Listar").forward(request, response);
                        break;
                    default:
                        Exception e;
                        break;
                }
            }
        }
        
        if (menu.equals("Usuario")) {
            if (accion.equals("Listar")) {
                List listaUsuario = userdao.listar();
                request.setAttribute("usuario", listaUsuario);
                request.getRequestDispatcher("Vista/Mantenimiento/Usuarios.jsp").forward(request, response);
            } else {
                switch (accion) {
                    case "Agregar":
                        String nom = request.getParameter("txtnom");
                        String clave = request.getParameter("txtclave");
                        String foto = request.getParameter("txtfoto");
                        String tipousuario = request.getParameter("cboTipoUsuario");
                        String estado = request.getParameter("cboEstado");
                        Object[] obUser = new Object[6];
                        obUser[0] = nom;
                        obUser[1] = clave;
                        obUser[2] = foto;
                        obUser[3] = tipousuario;
                        obUser[4] = estado;
                        userdao.agregar(obUser);
                        flag = "USER";
                        request.setAttribute("flag", flag);
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;
                    case "Editar":
                        int idUserEdit = Integer.parseInt(request.getParameter("cod"));
                        Usuario UserEditar = userdao.listarId(idUserEdit);
                        request.setAttribute("usuarios", UserEditar);
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;
                    case "Actualizar":
                        String nomup = request.getParameter("txtnom");
                        String claveup = request.getParameter("txtclave");
                        String fotoup = request.getParameter("txtfoto");
                        String tipousuarioup = request.getParameter("cboTipoUsuario");
                        String estadoup = request.getParameter("cboEstado");
                        String codUp = request.getParameter("txtCod");
                        Object[] obUserUp = new Object[6];
                        obUserUp[0] = nomup;
                        obUserUp[1] = claveup;
                        obUserUp[2] = fotoup;
                        obUserUp[3] = tipousuarioup;
                        obUserUp[4] = estadoup;
                        obUserUp[5] = codUp;
                        userdao.actualizar(obUserUp);
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;
                    case "Eliminar":
                        int idProElim = Integer.parseInt(request.getParameter("cod"));
                        userdao.eliminar(idProElim);
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;
                    default:
                        Exception e;
                        break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
