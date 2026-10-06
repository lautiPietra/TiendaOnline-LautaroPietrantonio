<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultaproducto.aspx.cs" Inherits="TiendaOnline_LautaroPietrantonio.consultaproducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consulta de productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="encabezado">TiendaTech <span>| Tienda Online de Tecnología</span></div>
        <div class="contenedor">
            <h1>Consulta de productos</h1>
            <div class="campo">
                <span class="etiqueta">Ingrese el código del producto:</span>
                <div>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Consultar" OnClick="Button1_Click" />
                </div>
            </div>
            <asp:Label ID="Label1" runat="server" CssClass="mensaje"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idProducto"
                DataSourceID="SqlDataSourceListado" AllowSorting="True" Caption="Listado de productos"
                CssClass="grilla" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="idProducto" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="idProducto" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="descricategoria" HeaderText="Categoría" SortExpression="descricategoria" />
                </Columns>
            </asp:GridView>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="volver">Volver a la página principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select pr.nombre, pr.precio, ca.descripcion as descricategoria from productos as pr join categorias as ca on ca.idCategoria = pr.idCategoria where pr.idProducto = @idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceListado" runat="server"
                ConnectionString="<%$ ConnectionStrings:tiendaonline %>"
                SelectCommand="select pr.idProducto, pr.nombre, pr.precio, ca.descripcion as descricategoria from productos as pr join categorias as ca on ca.idCategoria = pr.idCategoria">
            </asp:SqlDataSource>
        </div>
        <div class="pie">Parcial 1 - Laboratorio de Programación 3 - Lautaro Pietrantonio</div>
    </form>
</body>
</html>
