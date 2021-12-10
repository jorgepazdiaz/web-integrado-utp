<%-- 
    Document   : DetallePresupuesto
    Created on : 04/12/2021, 04:22:18 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>D'Sabor.com</title>
    </head>
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
                        <div class="col-md-6 order-md-1">
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">
                                    <h4><i class="fas fa-list-ol"></i> Seleccionar tu Menú</h4>
                                    <hr class="mb-4">

                                </div>
                            </div>
                            <div class="card border-light my-2 p-1 bg-body rounded shadow-sm">
                                <div class="card-body">

                                    <span>No ha Organizado su menú !</span>

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
                                            <img src="assets/img/food1.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="assets/img/food2.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="assets/img/food3.jpg" class="d-block w-100" alt="...">
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
                                <p>Elabora tu plan semanal, tenemos un extenso catálogo de ingredientes. </p>
                                <p>¿Se te antojó un lomo saltado? ¿Quizá una ensalada César? Agrega snacks, ensaladas, bebidas y más.</p>
                                <button class="btn btn-outline-light btn-block" type="button">Visualiza tus presupuestos</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <%@ include file='/Vista/Genericos/Scripts.jsp' %>
    </body>
</html>
