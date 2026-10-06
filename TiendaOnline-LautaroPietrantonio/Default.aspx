<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TiendaOnline_LautaroPietrantonio.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tienda Online - Tecnología</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">TiendaTech <span>| Tienda Online de Tecnología</span></div>
        <div class="contenedor">
            <h1>Administración de productos</h1>
            <p class="subtitulo">Seleccione la operación que desea realizar:</p>
            <div>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/altaproducto.aspx" CssClass="opcion">Alta de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/consultaproducto.aspx" CssClass="opcion">Consulta de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/modificarproducto.aspx" CssClass="opcion">Modificación de productos</asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/bajaproducto.aspx" CssClass="opcion">Baja de productos</asp:HyperLink>
            </div>
        </div>
        <div class="pie">Parcial 1 - Laboratorio de Programación 3 - Lautaro Pietrantonio</div>
    </form>
</body>
</html>
