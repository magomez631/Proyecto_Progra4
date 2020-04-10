using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace Web.Interfaces
{
    public partial class frmPrincipal : System.Web.UI.Page
    {

       
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                if (string.IsNullOrEmpty(txtIdentificacion.Text)) throw new Exception("Ingrese identificacion");

                Logica.Clases.clsEmpleados obclsClientes = new Logica.Clases.clsEmpleados();

                DataSet dsConsulta = obclsClientes.stConsultarEmpleado(Convert.ToInt64(txtIdentificacion.Text));

                if (dsConsulta.Tables[0].Rows.Count == 0) gvwDatos.DataSource = null;
                else gvwDatos.DataSource = dsConsulta;

                gvwDatos.DataBind();

                limpiarControles();
            }
            catch (Exception ex) { lblMensaje.Text = ex.Message; }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                if (string.IsNullOrEmpty(txtIdentificacion.Text)) throw new Exception("Ingrese un número de identificación");

                Logica.Clases.clsEmpleados obclsClientes = new Logica.Clases.clsEmpleados();

                lblMensaje.Text = obclsClientes.stInsertarEmpleado(Convert.ToInt64(txtIdentificacion.Text),
                    txtNombres.Text,
                    txtApellidos.Text,
                    txtUsuario.Text, Convert.ToInt64(txtContrasena.Text));

                limpiarControles();
                 
            }
            catch (Exception ex) { lblMensaje.Text = ex.Message; }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                if (string.IsNullOrEmpty(txtIdentificacion.Text)) throw new Exception("Ingrese un número de identificación");

                Logica.Clases.clsEmpleados obclsClientes = new Logica.Clases.clsEmpleados();

                lblMensaje.Text = obclsClientes.stModificarEmpleado(Convert.ToInt64(txtIdentificacion.Text),
                    txtNombres.Text,
                    txtApellidos.Text);
            }
            catch (Exception ex) { lblMensaje.Text = ex.Message; }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                if (string.IsNullOrEmpty(txtIdentificacion.Text)) throw new Exception("Ingrese un número de identificación");
                Logica.Clases.clsEmpleados obclsClientes = new Logica.Clases.clsEmpleados();

                lblMensaje.Text = obclsClientes.stEliminarEmpleado(Convert.ToInt64(txtIdentificacion.Text));
            }
            catch (Exception ex) { lblMensaje.Text = ex.Message; }
        }

        protected void btnRegistarMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMarcaEmpleado.aspx");
        }


        void limpiarControles() 
        {
            txtIdentificacion.Text = string.Empty;
            txtNombres.Text = string.Empty;
            txtApellidos.Text = string.Empty;
            txtUsuario.Text = string.Empty;
            txtContrasena.Text = string.Empty;
        }
    }
}