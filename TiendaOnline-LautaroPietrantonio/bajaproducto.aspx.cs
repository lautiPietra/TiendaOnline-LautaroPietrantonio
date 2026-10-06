using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TiendaOnline_LautaroPietrantonio
{
    public partial class bajaproducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int codigo;
            this.Label1.Text = "";
            this.Label2.Text = "";
            if (!int.TryParse(this.TextBox1.Text, out codigo))
            {
                this.Label2.Text = "Debe ingresar un código numérico";
            }
            else
            {
                this.SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = this.TextBox1.Text;
                this.SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;

                SqlDataReader registros;
                registros = (SqlDataReader)this.SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);

                if (registros.Read())
                    this.Label1.Text = "Producto a eliminar:" +
                                       "<br>Nombre:" + registros["nombre"] +
                                       "<br>Precio:" + registros["precio"] +
                                       "<br>Categoría:" + registros["descricategoria"];
                else
                    this.Label2.Text = "No existe un producto con dicho código";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.Label1.Text == "")
            {
                this.Label2.Text = "Primero debe buscar el producto a eliminar";
            }
            else
            {
                this.SqlDataSourceProductos.DeleteParameters["idProducto"].DefaultValue = this.TextBox1.Text;

                int cant = this.SqlDataSourceProductos.Delete();
                if (cant == 1)
                {
                    this.Label1.Text = "";
                    this.Label2.Text = "Se borró el producto";
                    this.TextBox1.Text = "";
                }
                else
                    this.Label2.Text = "No existe el código";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            this.Label1.Text = "";
            this.Label2.Text = "";
        }
    }
}