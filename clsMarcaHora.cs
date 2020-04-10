using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Web.Logica.Clases;


namespace Web.Logica.Clases
{
    public class clsMarcaHora
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsMarcaHora()
        {
            clsConexion obclsConexion = new clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }

        public DataSet stConsultarMarcaTodos()
        {
            try
            {

                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarMarcaTodos", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
              
                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;

            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public DataSet stConsultarMarca(long lnIdentificacion)
        {
            try
            {
                if (string.IsNullOrEmpty(Convert.ToString(lnIdentificacion)))
                {
                    DataSet dsConsulta = new DataSet();

                    sqlConnection = new SqlConnection(stConexion);
                    sqlConnection.Open();

                    sqlCommand = new SqlCommand("spConsultarMarcaTodos", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    sqlCommand.ExecuteNonQuery();
                    sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    sqlDataAdapter.Fill(dsConsulta);

                    return dsConsulta;

                }
                else
                {
                    DataSet dsConsulta = new DataSet();

                    sqlConnection = new SqlConnection(stConexion);
                    sqlConnection.Open();

                    sqlCommand = new SqlCommand("spConsultarMarca", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.Add(new SqlParameter("@empIdentficacion", lnIdentificacion));


                    sqlCommand.ExecuteNonQuery();
                    sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    sqlDataAdapter.Fill(dsConsulta);

                    return dsConsulta;
                }
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public string stInsertarMarca(long lnIdentificacion, DateTime stHora)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spInsertarMarcaEmpleado", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@empHora", stHora));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@empMensaje";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }

        }
    }
}
