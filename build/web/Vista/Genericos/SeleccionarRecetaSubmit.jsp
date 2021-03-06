<%-- 
    Document   : DetallePresupuesto
    Created on : 04/12/2021, 04:22:18 AM
    Author     : 
--%>

<%@page import="Modelo.Entidad.Receta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Dao.RecetaDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String seleccionarComidas = request.getParameter("seleccionarComidas");
    String comidas[] = request.getParameterValues("check");

    RecetaDao rectdao = new RecetaDao();

    List<Receta> listaRecetas = rectdao.listar();
    List<Receta> listaMenusSeleccionadas = new ArrayList();

    //System.out.println("saape: " + comidas.toString());
    
    if(comidas.length > 0){
        for (int i = 0; i < comidas.length; i++) {
        //System.out.println("comidas: " + comidas[i]);

        for (int j = 0; j < listaRecetas.size(); j++) {
            //System.out.println("listaRecetas " + listaRecetas.get(i));
            if (comidas[i].toString().equalsIgnoreCase(listaRecetas.get(j).getTipoComida())) {
                listaMenusSeleccionadas.add(listaRecetas.get(j));
            }
        }
    }
    request.setAttribute("listaMenusSeleccionadas", listaMenusSeleccionadas);
    }
    


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <link rel="icon" type="image/png" sizes="16x16" href="/../../assets/img/cerdito.png">
        <title>D'Sabor.com</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="/../../assets/css/estilos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

        <title>D'Sabor.com</title>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="/../../assets/js/script.js"></script>
    </head>

    <%@ include file='/Vista/Genericos/Cabecera.jsp' %>
    <body>
        <div class="wrapper text-muted">
            <!-- Sidebar  -->
            <%@ include file='/Vista/Genericos/Menu.jsp' %>
            <!-- Page Content  -->
            <div id="content">
                <%@ include file='/Vista/Genericos/BarraSuperior.jsp' %>
                <div class="container-fluid ">
                    <div class="row">
                        <div class="col-md-6 order-md-1">
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">
                                    <h4><i class="fas fa-list-ol"></i> Seleccionar tu Men?? Submit</h4>
                                    <hr class="mb-4">

                                </div>
                            </div>
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">
                                    <form action="DetallePresupuestoCalcular.jsp">

                                        <table id="tablaCategoria" class="table table-hover table-sm table-bordered">
                                            <thead class="table-dark text-center">
                                                <tr>
                                                    <th scope="col">SELECCIONE</th>
                                                    <th scope="col">NOMBRE</th>
                                                    <th scope="col">PRECIO</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center text-muted">
                                                <c:forEach var="receta" items="${listaMenusSeleccionadas}">
                                                    <tr>
                                                        <td>
                                                            <input class="form-check-input"  name="checkReceta" type="checkbox"  value="${receta.getNombre()}"/>
                                                        </td>
                                                        <td>${receta.getNombre()}</th>
                                                        <td>${'S/.'} ${receta.getPrecio()}</td>
                                                    </tr> 
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <button type="submit" name="RegistarComidas" value="registarComidas" class="btn btn-success btn-circle w-100">
                                            <i class="fas fa-dollar-sign"></i> 
                                            Calcular
                                        </button>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3 order-md-2">
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="/../../assets/img/food1.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/../../assets/img/food2.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/../../assets/img/food3.jpg" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Anterior</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Siguiente</span>
                                    </button>
                                </div>
                            </div>
                            <div class="p-5 text-white bg-dark rounded-3">
                                <h5>Este es el primer paso a cumplir tu objetivo</h5>
                                <p>Elabora tu plan semanal, tenemos un extenso cat??logo de ingredientes. </p>
                                <p>??Se te antoj?? un lomo saltado? ??Quiz?? una ensalada C??sar? Agrega snacks, ensaladas, bebidas y m??s.</p>
                                <button class="btn btn-outline-light btn-block" type="button">Visualiza tus presupuestos</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <%@ include file='/Vista/Genericos/Scripts.jsp' %>
    </body>
</html>
