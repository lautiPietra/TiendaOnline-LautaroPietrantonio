using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TiendaOnline_LautaroPietrantonio
{
    public partial class modificarproducto : System.Web.UI.Page
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
                {
                    this.TextBox2.Text = registros["nombre"].ToString();
                    this.TextBox3.Text = registros["precio"].ToString();
                    this.DropDownList1.DataSource = this.SqlDataSourceCategorias;
                    this.DropDownList1.DataTextField = "descripcion";
                    this.DropDownList1.DataValueField = "idCategoria";
                    this.DropDownList1.DataBind();
                    this.DropDownList1.SelectedValue = registros["idCategoria"].ToString();
                    this.Label1.Text = "";
                }
                else
                {
                    this.TextBox2.Text = "";
                    this.TextBox3.Text = "";
                    this.DropDownList1.Items.Clear();
                    this.Label1.Text = "No existe un producto con dicho código";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            double precio;
            if (this.DropDownList1.Items.Count == 0)
            {
                this.Label1.Text = "Primero debe buscar el producto a modificar";
            }
            else if (this.TextBox2.Text == "" || !double.TryParse(this.TextBox3.Text, out precio))
            {
                this.Label1.Text = "Debe completar el nombre y un precio numérico";
            }
            else
            {
                this.SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = this.TextBox1.Text;
                this.SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;

                SqlDataReader registros;
                registros = (SqlDataReader)this.SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);

                if (!registros.Read())
                {
                    this.Label1.Text = "No existe el código";
                }
                else if (this.TextBox2.Text == registros["nombre"].ToString() &&
                         precio == (double)registros["precio"] &&
                         this.DropDownList1.SelectedValue == registros["idCategoria"].ToString())
                {
                    this.Label1.Text = "No se modificó ningún campo";
                }
                else
                {
                    this.SqlDataSourceProductos.UpdateParameters["nombre"].DefaultValue = this.TextBox2.Text;
                    this.SqlDataSourceProductos.UpdateParameters["precio"].DefaultValue = this.TextBox3.Text;
                    this.SqlDataSourceProductos.UpdateParameters["idCategoria"].DefaultValue = this.DropDownList1.SelectedValue;
                    this.SqlDataSourceProductos.UpdateParameters["idProducto"].DefaultValue = this.TextBox1.Text;

                    int cant = this.SqlDataSourceProductos.Update();
                    if (cant == 1)
                        this.Label1.Text = "Se modificó el producto";
                    else
                        this.Label1.Text = "No existe el código";
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            this.TextBox2.Text = "";
            this.TextBox3.Text = "";
            this.DropDownList1.Items.Clear();
        }
    }
}