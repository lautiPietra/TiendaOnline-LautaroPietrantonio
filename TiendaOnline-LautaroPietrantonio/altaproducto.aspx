<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="altaproducto.aspx.cs" Inherits="TiendaOnline_LautaroPietrantonio.altaproducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">TiendaTech <span>| Tienda Online de Tecnología</span></div>
        <div class="contenedor">
            <h1>Alta de productos</h1>
            <div class="campo">
                <span class="etiqueta">Nombre:</span>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="campo">
                <span class="etiqueta">Precio:</span>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="campo">
                <span class="etiqueta">Categoría:</span>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="descripcion" DataValueField="idCategoria">
                </asp:DropDownList>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Confirmar" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="volver">Volver a la página principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select idCategoria, descripcion from categorias">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                InsertCommand="insert into productos(nombre, precio, idCategoria) values(@nombre, @precio, @idCategoria)">
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Double" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <div class="pie">Parcial 1 - Laboratorio de Programación 3 - Lautaro Pietrantonio</div>
    </form>
</body>
</html>
