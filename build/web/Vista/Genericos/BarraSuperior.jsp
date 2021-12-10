<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <button id="sidebarCollapse" class="btn btn-light" type="button"><i
                class="fas fa-bars"></i></button>
        <button class="btn btn-light d-inline-block d-lg-none ml-auto collapsed" data-bs-toggle="collapse" data-bs-target="#barra" aria-expanded="false"><i
                class="fas fa-angle-down"></i></button>
        <div class="collapse navbar-collapse" id="barra">
            <ul class="nav navbar-nav ml-auto">
                
                <% 
                    String user = "";
                    HttpSession sesion= request.getSession();
                    user = (String)sesion.getAttribute("usuario");
                    
                %>
                <li class="nav-item">
                    <a class="dropdown-item disabled" href="javascript:void(0)">
                        Bienvenido
                        <i class="fas fa-user"></i>
                         <%=user %> 
                    </a>
                </li>
                <li class="nav-item">
                    <a class="dropdown-item disabled" href="javascript:void(0)"><i class="fas fa-smile"></i>  D'Sabor.com </a>
                </li>
                
               
                
            </ul>
        </div>
    </div>
    <input type="hidden" value="${flag}" id="txtFlag" name="txtCod" readonly="true">
</nav>