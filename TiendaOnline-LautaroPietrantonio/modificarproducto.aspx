<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modificarproducto.aspx.cs" Inherits="TiendaOnline_LautaroPietrantonio.modificarproducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificación de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">TiendaTech <span>| Tienda Online de Tecnología</span></div>
        <div class="contenedor">
            <h1>Modificación de productos</h1>
            <div class="campo">
                <span class="etiqueta">Ingrese el código del producto:</span>
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
                </div>
            </div>
            <hr class="separador" />
            <div class="campo">
                <span class="etiqueta">Nombre:</span>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="campo">
                <span class="etiqueta">Precio:</span>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div class="campo">
                <span class="etiqueta">Categoría:</span>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </div>
            <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="volver">Volver a la página principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select * from productos where idProducto = @idProducto"
                UpdateCommand="update productos set nombre = @nombre, precio = @precio, idCategoria = @idCategoria where idProducto = @idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Double" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select * from categorias">
            </asp:SqlDataSource>
        </div>
        <div class="pie">Parcial 1 - Laboratorio de Programación 3 - Lautaro Pietrantonio</div>
    </form>
</body>
</html>
