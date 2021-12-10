<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("sesionUser") == null) {
        response.sendRedirect("index.jsp");
        sesion.invalidate();
    }
%>