using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace Web.Interfaces
{
    public partial class frmMarcaEmpleado : System.Web.UI.Page
    {

        public override void VerifyRenderingInServerForm(Control control)
        {
            //
        }

        void exportarExcel() 
        
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Reporte_Marca_Empleados.xls";
            System.IO.StringWriter strwritter = new System.IO.StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "Reporte_Marca_Empleados";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvwDatosMarca.GridLines = GridLines.Both;
            gvwDatosMarca.HeaderStyle.Font.Bold = true;
            gvwDatosMarca.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();


        }
        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            exportarExcel(); 
        }

        protected void btnMarcar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                if (string.IsNullOrEmpty(txtIdentificacion2.Text)) throw new Exception("Ingrese un número de identificación");

                Logica.Clases.clsMarcaHora obclsMarca = new Logica.Clases.clsMarcaHora();
                 DateTime Hora = DateTime.Now;

                lblMensaje.Text = obclsMarca.stInsertarMarca((Convert.ToInt64(txtIdentificacion2.Text)),Hora);
          
            }

            catch (Exception ex) { lblMensaje.Text = ex.Message; }

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPrincipal.aspx");
        }

        protected void btnConsultarMarcas_Click(object sender, EventArgs e)
        {

            try
            {
                lblMensaje.Text = "";
                // if (string.IsNullOrEmpty(txtIdentificacion2.Text)) throw new Exception("Ingrese identificación");
                if (string.IsNullOrEmpty(txtIdentificacion2.Text))
                {
                    Logica.Clases.clsMarcaHora marca = new Logica.Clases.clsMarcaHora();

                    DataSet dsConsulta = marca.stConsultarMarcaTodos();   //(Convert.ToInt64(txtIdentificacion2.Text));

                    if (dsConsulta.Tables[0].Rows.Count == 0) gvwDatosMarca.DataSource = null;


                    else gvwDatosMarca.DataSource = dsConsulta;

                    gvwDatosMarca.DataBind();


                }
                else
                {

                    Logica.Clases.clsMarcaHora marca = new Logica.Clases.clsMarcaHora();

                    DataSet dsConsulta = marca.stConsultarMarca(Convert.ToInt64(txtIdentificacion2.Text));

                    if (dsConsulta.Tables[0].Rows.Count == 0) gvwDatosMarca.DataSource = null;


                    else gvwDatosMarca.DataSource = dsConsulta;

                    gvwDatosMarca.DataBind();
                }
                
            }
            catch (Exception ex)  { lblMensaje.Text = ex.Message; }

            


        }

        protected void gvwDatos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}