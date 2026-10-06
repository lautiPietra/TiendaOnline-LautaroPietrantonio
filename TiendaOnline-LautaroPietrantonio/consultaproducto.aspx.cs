using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TiendaOnline_LautaroPietrantonio
{
    public partial class consultaproducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int codigo;
            if (!int.TryParse(this.TextBox1.Text, out codigo))
            {
                this.Label1.Text = "Debe ingresar un código numérico";
            }
            else
            {
                this.SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = this.TextBox1.Text;
                this.SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;

                SqlDataReader registros;
                registros = (SqlDataReader)this.SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);

                if (registros.Read())
                    this.Label1.Text = "Nombre:" + registros["nombre"] +
                                       "<br>Precio:" + registros["precio"] +
                                       "<br>Categoría:" + registros["descricategoria"];
                else
                    this.Label1.Text = "No existe un producto con dicho código";
            }
        }
    }
}