/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Modelo.Entidad.Receta;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author david
 */
@WebServlet(name = "reportePresupuestoPDF", urlPatterns = {"/reportePresupuestoPDF"})
public class reportePresupuestoPDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");

        OutputStream out = response.getOutputStream();

        List<Receta> listaMenusSeleccionadasParaPresupuesto = new ArrayList();
        double total = 0.0;
        double IGV = 0.18;
        double subTotal = 0.0;

        HttpSession sesionOK = request.getSession();
        listaMenusSeleccionadasParaPresupuesto = (List<Receta>) sesionOK.getAttribute("listaMenusSeleccionadasParaPresupuesto");//PrintWriter out = response.getWriter();
        total = (double) sesionOK.getAttribute("total");
        IGV = (double) sesionOK.getAttribute("IGV");
        subTotal = (double) sesionOK.getAttribute("subTotal");

        try {
                        

            try {
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();
                
                //Imagen
                Image imagen = Image.getInstance("D:\\UTP\\Desarrollo Web Integrado\\dsaborcom-main\\web\\assets\\img\\dsaborcom.png");
                imagen.setAlignment(Element.ALIGN_RIGHT);
                //imagen.scaleToFit(250,250);
                documento.add(imagen);
                
                
                //Titulo
                Paragraph par1 = new Paragraph();
                Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.GRAY);
                par1.add(new Phrase("\n Presupuesto Dieta \n ", fontTitulo));
                documento.add(par1);
                
                //Tabla
                
                PdfPTable tabla = new PdfPTable(2); //tabla de 2 columnas
                
                PdfPCell celda1 = new PdfPCell(new Paragraph("COMIDA", FontFactory.getFont("HELVETICA", 14, Font.BOLD, BaseColor.DARK_GRAY)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("(S/.)PRECIO", FontFactory.getFont("HELVETICA", 14, Font.BOLD, BaseColor.DARK_GRAY)));
                
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                
                for (Receta MenusSeleccionadasParaPresupuesto : listaMenusSeleccionadasParaPresupuesto) {
                    tabla.addCell(MenusSeleccionadasParaPresupuesto.getNombre());
                    tabla.addCell(Double.toString(MenusSeleccionadasParaPresupuesto.getPrecio()));
                    
                }
                documento.add(tabla);
                                
                
                //SubTotal
                Paragraph par2 = new Paragraph();
                Font fontSubTotal = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.GRAY);
                par2.add(new Phrase("SUB TOTAL: " + Double.toString(subTotal), fontSubTotal));
                par2.setAlignment(Element.ALIGN_RIGHT);
                documento.add(par2);

                
                //IGV
                Paragraph par3 = new Paragraph();
                Font fontIGV = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.GRAY);
                par3.add(new Phrase("I.G.V.: " + Double.toString(IGV), fontIGV));
                par3.setAlignment(Element.ALIGN_RIGHT);
                documento.add(par3);
                
                //SubTotal
                Paragraph par4 = new Paragraph();
                Font fontTotal = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.GRAY);
                par4.add(new Phrase("TOTAL(S/.): " + Double.toString(total), fontSubTotal));
                par4.setAlignment(Element.ALIGN_RIGHT);
                documento.add(par4);
                
                documento.close();
                response.sendRedirect("index.jsp");

            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }

        } finally {
            out.close();
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
