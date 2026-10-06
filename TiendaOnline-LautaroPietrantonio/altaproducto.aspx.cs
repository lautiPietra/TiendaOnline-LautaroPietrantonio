using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnline_LautaroPietrantonio
{
    public partial class altaproducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double precio;
            if (this.TextBox1.Text == "" || this.TextBox2.Text == "")
            {
                this.Label1.Text = "Debe completar el nombre y el precio";
            }
            else if (!double.TryParse(this.TextBox2.Text, out precio))
            {
                this.Label1.Text = "El precio debe ser un número";
            }
            else
            {
                this.SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue = this.TextBox1.Text;
                this.SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = this.TextBox2.Text;
                this.SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue = this.DropDownList1.SelectedValue;

                this.SqlDataSourceProductos.Insert();

                this.Label1.Text = "Se efectuó la carga";
                this.TextBox1.Text = "";
                this.TextBox2.Text = "";
            }
        }
    }
}