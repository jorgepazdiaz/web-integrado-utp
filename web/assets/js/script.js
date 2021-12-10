    $(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
    
    var traduccion = {
    processing: "Tratamiento en curso...",
            search: "Buscar",
            lengthMenu: "Mostrar _MENU_ filas",
            info: "Filas del _START_ al _END_ de un total de _TOTAL_",
            infoEmpty: "No existen datos.",
            infoFiltered: "(filtrado de _MAX_ elementos en total)",
            infoPostFix: "",
            loadingRecords: "Cargando...",
            zeroRecords: "No se encontraron datos.",
            emptyTable: "No hay datos disponibles.",
            paginate: {
            first: "<<",
                    previous: "<",
                    next: ">",
                    last: ">>"
            },
            aria: {
            sortAscending: ": active para ordenar la columna en orden ascendente",
            sortDescending: ": active para ordenar la columna en orden descendente"
        }
    };
    var paginadoGenerico = [
            [11, 25, 50, -1],
            [11, 25, 50, "Todos"]
        ];
    var paginado = [
            [11, 20, 30, -1],
            [11, 20, 30, "Todos"]
        ];
    var paginadoCompra = [
            [6, 12, 20, -1],
            [6, 12, 20, "Todos"]
    ];
    var paginadoVenta = [
            [10, 20, 30, -1],
            [10, 20, 30, "Todos"]
    ];
       
    var scrollLateral = 520;
    
    $('#tablaGeneral').DataTable({
        language: traduccion,
        scrollY: 440,
        scrollX: false,
        lengthMenu: paginadoGenerico
    });
    
    $('#tablaCategoria').DataTable({
        language: traduccion,
        scrollY: scrollLateral,
        scrollX: false,
        lengthMenu: paginado
    });
    $('#tablaComida').DataTable({
        language: traduccion,
        scrollY: scrollLateral,
        scrollX: false,
        lengthMenu: paginado
    });
    $('#tablaInsumo').DataTable({
        language: traduccion,
        scrollY: scrollLateral,
        scrollX: false,
        lengthMenu: paginado
    });
    $('#tablaStock').DataTable({
        language: traduccion,
        scrollY: 530,
        scrollX: false,
        lengthMenu: paginadoGenerico
    });
    $('#tablaCompra').DataTable({
        language: traduccion,
        scrollY: 210,
        scrollX: false,
        lengthMenu: paginadoCompra
    });
    $('#tablaVentas').DataTable({
        language: traduccion,
        scrollY: 300,
        scrollX: false,
        lengthMenu: paginadoVenta
    });
});