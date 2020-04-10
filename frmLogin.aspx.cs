using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Threading;
using System.Diagnostics;

namespace Web.Interfaces
{
    public partial class frmLogin : System.Web.UI.Page
    {

        #region "Variables"
            string logname = "LogAppWebEmpleados";
            string Origen  = "AppEventosLoginEmpleado";
  
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void limpiarControles() 
        
        {
            txtUsuario.Text = string.Empty;
            txtContrasena.Text = string.Empty;
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (!EventLog.Exists(logname))
                {
                    EventLog.CreateEventSource(Origen, logname);
                }

                if ((string.IsNullOrEmpty(txtUsuario.Text)) || (string.IsNullOrEmpty(txtContrasena.Text)))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", "<script>swal('Atención', 'Favor ingresar usuario o clave', 'warning')</script>");

                    return;
                }

               

                Logica.Clases.clsLogin login = new Logica.Clases.clsLogin();
                string mensaje = login.stLoginEmpleado(txtUsuario.Text, Convert.ToInt64(txtContrasena.Text));

                limpiarControles();

                string mensaje1 = "Usuario " + txtUsuario.Text + " ingresó correctamente";
                string mensaje2 = "Usuario " + txtUsuario.Text + " trató de ingresar";

                if (mensaje == "1") 
                {
                   

                    if (EventLog.SourceExists(Origen)) 
                    {
                        EventLog.WriteEntry(Origen, mensaje1);
                    }
                    Response.Redirect("frmPrincipal.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", "<script>swal('Atención', 'Usuario o clave incorrectos', 'warning')</script>"); if (EventLog.SourceExists(Origen))

                        if (EventLog.SourceExists(Origen))
                        {
                            EventLog.WriteEntry(Origen, mensaje2);
                        }




                }

            }
            catch (Exception ) { throw; }
        }
    }
}