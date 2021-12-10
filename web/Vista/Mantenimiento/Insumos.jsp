<%@page import="Modelo.Entidad.Insumo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Modelo.Entidad.Medida" %>
<%@page import="Modelo.Entidad.Categoria" %>
<!DOCTYPE html>
<html>
    <%@ include file='/Vista/Genericos/Cabecera.jsp' %>
    <body>
        <div class="wrapper text-muted">
            <!-- Sidebar  -->
            <%@ include file='/Vista/Genericos/Menu.jsp' %>
            <!-- Page Content  -->
            <div id="content">
                <%@ include file='/Vista/Genericos/BarraSuperior.jsp' %>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 order-md-1">
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">
                                    <h4><i class="fas fa-carrot"></i> Mantenimiento de Insumos</h4>
                                    <hr class="mb-4">
                                    <% Insumo insumo = (Insumo) request.getAttribute("insumo");%>
                                    <form class="needs-validation" id="frmInsumo" action="Controlador?menu=Insumos" method="POST">
                                        <input type="hidden" value="${insumo.getCod()}" id="txtCod" name="txtCod" readonly="true">
                                        <div class="row">
                                            <div class="col-md-2 mb-3">
                                                <input type="text" class="form-control" value="${insumo.getNom()}" name="txtnom" id="txtnom" placeholder="Nombre de insumo" required>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <input type="hidden" value="<%= (insumo != null ? insumo.getCodCat() : "")%>" id="txtCategoria" name="txtCategoria" readonly="true">
                                                <select class="form-select" name="cboCategoria" id="cboCategoria" required>
                                                    <option value="">--Elegir categoría--</option>
                                                    <% List<Categoria> categoria = (List<Categoria>) request.getAttribute("categorias");
                                                        if (categoria != null)
                                                            for (Categoria cat : categoria) {
                                                                if (insumo != null && cat.getCod() == insumo.getCodCat()) {
                                                    %>
                                                    <option value="<%=cat.getCod()%>" selected><%=cat.getNom()%></option>
                                                    <%} else {
                                                    %>
                                                    <option value="<%=cat.getCod()%>"><%=cat.getNom()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <input type="hidden" value="<%= (insumo != null ? insumo.getCodMed() : "")%>" id="txtMedida" name="txtMedida" readonly="true">
                                                <select class="form-select" name="cboMedida" id="cboMedida" required>
                                                    <option value="">--Elegir medida--</option>
                                                    <%
                                                        List<Medida> medida = (List<Medida>) request.getAttribute("medidas");
                                                        if (medida != null)
                                                            for (Medida med : medida) {
                                                                if (insumo != null && med.getCod() == insumo.getCodMed()) {
                                                    %>
                                                    <option value="<%=med.getCod()%>" selected><%=med.getNom()%></option>
                                                    <%} else {
                                                    %>
                                                    <option value="<%=med.getCod()%>"><%=med.getNom()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <div class="input-group d-flex" role="group">
                                                <label class="input-group-text" for="inputGroupSelect01">S/.</label>
                                                <input type="number" step="0.01" class="form-control" value="${insumo.getPrecio()}" name="txtprecio" id="txtprecio" placeholder="Precio" required>
                                            </div>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <button type="submit" name="accion" id="btnGuardarInsumo" value="Agregar" class="btn btn-success btn-circle w-100"><i class="fas fa-plus"></i> Agregar</button>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <button type="submit" name="accion" value="Actualizar" class="btn btn-primary btn-circle w-100"><i class="fas fa-sync-alt"></i> Actualizar</button>                 
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">
                                    <table id="tablaInsumo" class="table table-hover table-sm table-bordered">
                                        <thead class="table-dark text-center">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">NOMBRE</th>
                                                <th scope="col">CATEGORIA</th>
                                                <th scope="col">MEDIDA</th>
                                                <th scope="col">PRECIO</th>
                                                <th scope="col">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center text-muted">
                                            <c:forEach var="ins" items="${insumos}">
                                                <tr>
                                                    <td>${ins.getCod()}</th>
                                                    <td>${ins.getNom()}</td>
                                                    <td>${ins.getCategoria()}</th>
                                                    <td>${ins.getMedida()}</th>
                                                    <td><sup>S/ </sup>${ins.getPrecio()}</th>
                                                    <td>
                                                        <a class="btn btn-sm btn-primary btn-circle" href="Controlador?menu=Insumos&accion=Editar&cod=${ins.getCod()}"><i class=" fas fa-edit"></i></a>
                                                        <a class="btn btn-sm btn-danger btn-circle" href="Controlador?menu=Insumos&accion=Eliminar&cod=${ins.getCod()}"><i class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file='/Vista/Genericos/Scripts.jsp' %>
    </body>
</html>