<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bajaproducto.aspx.cs" Inherits="TiendaOnline_LautaroPietrantonio.bajaproducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Baja de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">TiendaTech <span>| Tienda Online de Tecnología</span></div>
        <div class="contenedor">
            <h1>Baja de productos</h1>
            <div class="campo">
                <span class="etiqueta">Ingrese el código del producto:</span>
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
                </div>
            </div>
            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>
            <asp:Button ID="Button2" runat="server" Text="Borrar" OnClick="Button2_Click" CssClass="boton-peligro"
                OnClientClick="return confirm('¿Está seguro que desea eliminar el producto?');" />
            <asp:Label ID="Label2" runat="server" CssClass="mensaje"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="volver">Volver a la página principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select pr.nombre, pr.precio, ca.descripcion as descricategoria from productos as pr join categorias as ca on ca.idCategoria = pr.idCategoria where pr.idProducto = @idProducto"
                DeleteCommand="delete from productos where idProducto = @idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
        <div class="pie">Parcial 1 - Laboratorio de Programación 3 - Lautaro Pietrantonio</div>
    </form>
</body>
</html>
