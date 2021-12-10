package Controlador;
import Modelo.Dao.UsuarioDAO;
import Modelo.Entidad.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {
    Usuario Usuario = new Usuario();
    UsuarioDAO UsuarioDAO = new UsuarioDAO();
    String flag;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        if (request.getParameter("btnAcceder") != null) {
            Usuario usu = new Usuario();
            String user = request.getParameter("nombreUsuario");
            String clave = request.getParameter("clave");
            usu.setNombreUsuario(user);
            usu.setClave(clave);
            UsuarioDAO login = new UsuarioDAO();
            String estado;
            try {
                estado = login.login(usu);
                if ("true".equals(estado)) {
                    HttpSession objSesion = request.getSession();
                    if (usu.getTipoUsuario().equals("Administrador")) {
                        objSesion.setAttribute("usuario", user);
                        objSesion.setAttribute("nivel", "Administrador");
                        response.sendRedirect("index.jsp");
                    } else if (usu.getTipoUsuario().equals("Cliente")) {
                        objSesion.setAttribute("usuario", user);
                        objSesion.setAttribute("nivel", "Cliente");
                        response.sendRedirect("index.jsp");
                    }
                }
            } catch (Exception ex) {
                response.sendRedirect("login_Error.jsp");
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
