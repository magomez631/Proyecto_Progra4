using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Web.Logica.Clases
{
    public class clsEmpleados
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsEmpleados()
        {
            clsConexion obclsConexion = new clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }

        public DataSet stConsultarEmpleado(long lnIdentificacion)
        {
            try
            {
                DataSet dsConsulta = new DataSet();
                    
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spConsultarEmpleado", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;

               
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }

        public string stInsertarEmpleado(Int64 lnIdentificacion,
                                            string stNombres,
                                            string stApellidos,
                                            string stUsuario,
                                            Int64 stContrasena)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spInsertarEmpleado", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@empNombres", stNombres));
                sqlCommand.Parameters.Add(new SqlParameter("@empApellidos", stApellidos));
                sqlCommand.Parameters.Add(new SqlParameter("@empUsuario", stUsuario));
                sqlCommand.Parameters.Add(new SqlParameter("@empContrasena", stContrasena));

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

        public string stModificarEmpleado(long lnIdentificacion,
                                            string stNombres,
                                            string stApellidos)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spModificarEmpleado", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));
                sqlCommand.Parameters.Add(new SqlParameter("@empNombres", stNombres));
                sqlCommand.Parameters.Add(new SqlParameter("@empApellidos", stApellidos));

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

        public string stEliminarEmpleado(long lnIdentificacion)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spEliminarEmpleado", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

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
