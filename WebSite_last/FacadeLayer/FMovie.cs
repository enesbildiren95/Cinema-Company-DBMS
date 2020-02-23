using EntityLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace FacadeLayer
{
    public class FMovie
    {
        public  DataTable SelectData()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Connection.connection;
            cmd.CommandText = "select * from Film";
            SqlDataAdapter adptr = new SqlDataAdapter();
            adptr.SelectCommand = cmd;
            DataTable dtSelect = new DataTable();
            adptr.Fill(dtSelect);
            return dtSelect;
        }
        public  void insertFilm(string name, string release_date, int views, string trailer, int budget, int revenue)
        {
            throw new NotImplementedException();
        }
        public  List<string> getFilmByID(int id)
        {
            throw new NotImplementedException();
        }

     /*   public  void Insert(EMovie std)
        {
            string sqlQuery = "insert into Movie values('" + std.Name + "','" + "','" + std.Release_Date + "','" + std.Views + "','" + std.Trailer + "','" + std.Budget + "','" + std.Revenue + "','" + "'))";
            SqlCommand cmd = new SqlCommand(sqlQuery, Connection.connection);

              cmd.Parameters.AddWithValue("@Name", std.Name);
              cmd.Parameters.AddWithValue("@Release_Date", std.Release_Date);
              cmd.Parameters.AddWithValue("@Views", std.Views);
              cmd.Parameters.AddWithValue("@Trailer", std.Trailer);
              cmd.Parameters.AddWithValue("@Budget", std.Budget);
              cmd.Parameters.AddWithValue("@Revenue", std.Revenue);
            cmd.ExecuteNonQuery();
            
            if (Connection.connection.State == ConnectionState.Closed)
            {
                Connection.connection.Open();
            }
            cmd.ExecuteNonQuery();
            Connection.connection.Close();
        }*/
        public void insertMovie(string name, string release_date, int views, string trailer, int budget, int revenue)
        {
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand com = new SqlCommand("SP_InsertMovie @name, @release_Date, @views, @trailer, @budget, @revenue", Connection.connection);
            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            com.Parameters.AddWithValue("@name", name);
            com.Parameters.AddWithValue("@release_Date", release_date);
            com.Parameters.AddWithValue("@views", views);
            com.Parameters.AddWithValue("@trailer", trailer);
            com.Parameters.AddWithValue("@budget", budget);
            com.Parameters.AddWithValue("@revenue", revenue);
            adp.InsertCommand = com;
            adp.InsertCommand.ExecuteNonQuery(); ;
            com.Dispose();
            com.Connection.Close();
        }

        public void updateMovie(int id,string name, string release_date, int views, string trailer, int budget, int revenue)
        {
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand com = new SqlCommand("SP_UpdateMovie @ID, @name, @release_Date, @views, @trailer, @budget, @revenue", Connection.connection);
            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            com.Parameters.AddWithValue("@ID",id);
            com.Parameters.AddWithValue("@name", name);
            com.Parameters.AddWithValue("@release_Date", release_date);
            com.Parameters.AddWithValue("@views", views);
            com.Parameters.AddWithValue("@trailer", trailer);
            com.Parameters.AddWithValue("@budget", budget);
            com.Parameters.AddWithValue("@revenue", revenue);
            adp.InsertCommand = com;
            adp.InsertCommand.ExecuteNonQuery(); ;
            com.Dispose();
            com.Connection.Close();
        }
        public int deleteMovie(int id)
        {
            SqlDataAdapter adp = new SqlDataAdapter();
            SqlCommand com = new SqlCommand("SP_DeleteMovie @ID", Connection.connection);
            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            com.Parameters.AddWithValue("@ID", id);
            adp.InsertCommand = com;
            try
            {
                adp.InsertCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                com.Dispose();
                com.Connection.Close();
                return -1;
            }
            com.Dispose();
            com.Connection.Close();
            return 1;
        }

        public  void InsertFilm(string name, string release_date, int views, string trailer, int budget, int revenue)
        {
            throw new NotImplementedException();
        }
    }
}
