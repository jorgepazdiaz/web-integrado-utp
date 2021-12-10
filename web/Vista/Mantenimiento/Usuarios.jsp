<%@page import="Modelo.Entidad.Usuario"%>
<%@page import="Modelo.Entidad.Comida"%>
<%@page import="Modelo.Entidad.Receta"%>
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
                                    <h4><i class="fas fa-carrot"></i> Mantenimiento de Usuarios</h4>
                                    <hr class="mb-4">
                                    <% Usuario usuario = (Usuario) request.getAttribute("usuarios");%>
                                    <form class="needs-validation" id="frmUsuario" action="Controlador?menu=Usuario" method="POST">
                                        <input type="hidden" value="${usuarios.getIdUsuario()}" id="txtCod" name="txtCod" readonly="true">
                                        <div class="row">
                                            <div class="col-md-2 mb-3">
                                                <input type="text" class="form-control" value="${usuarios.getNombreUsuario()}" name="txtnom" id="txtnom" placeholder="Nombre de Usuario" required>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <input type="password" class="form-control" value="${usuarios.getClave()}" name="txtclave" id="txtnom" placeholder="Contraseña" required>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <input type="text" class="form-control" value="${usuarios.getFoto()}" name="txtfoto" id="txtfoto" placeholder="Seleccionar foto" required>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                            <select class="form-select" name="cboTipoUsuario" id="cboTipoUsuario" required>
                                                    <option value="">--Tipo de Usuario--</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cliente">Cliente</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                            <select class="form-select" name="cboEstado" id="cboEstado" required>
                                                    <option value="">--Estado--</option>
                                                    <option value="P">Publico</option>
                                                    <option value="R">Restringido</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <button type="submit" name="accion" id="btnGuardarUsuario" value="Agregar" class="btn btn-success btn-circle w-100"><i class="fas fa-plus"></i> Agregar</button>
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
                                    <table id="tablaReceta" class="table table-hover table-sm table-bordered">
                                        <thead class="table-dark text-center">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">NOMBRE</th>
                                                <%--<th scope="col">CLAVE</th>--%>
                                                <th scope="col">FOTO</th>
                                                <th scope="col">TIPO DE USUARIO</th>
                                                <th scope="col">ESTADO</th>
                                                <th scope="col">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center text-muted">
                                            <c:forEach var="usuario" items="${usuario}">
                                                <tr>
                                                    <td>${usuario.getIdUsuario()}</th>
                                                    <td>${usuario.getNombreUsuario()}</td>
                                                    <%--<td>${usuario.getClave()}</th>--%>
                                                    <td>${usuario.getFoto()}</th>
                                                    <td>${usuario.getTipoUsuario()}</th>
                                                    <td>${usuario.getEstado()}</th>
                                                    <td>
                                                        <a class="btn btn-sm btn-primary btn-circle" href="Controlador?menu=Usuario&accion=Editar&cod=${usuario.getIdUsuario()}"><i class=" fas fa-edit"></i></a>
                                                        <a class="btn btn-sm btn-danger btn-circle" href="Controlador?menu=Usuario&accion=Eliminar&cod=${usuario.getIdUsuario()}"><i class="fas fa-trash-alt"></i></a>
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