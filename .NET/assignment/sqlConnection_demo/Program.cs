using System;
using System.Data.SqlClient;
namespace TestDBMSConnectionApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            Console.WriteLine("Getting Connection ...");

            var datasource = @"LAPTOP-DANMUS7P\SQLEXPRESS"; // your server
            var database = "dotnet_C5"; // your database name dotnet_C5 student_table1
            //var username = "DESKTOP-LCNNVH9\\kk"; // username of server to connect
            //var password = ""; // password

            // Create your connection string
            string connString = @"Data Source=" + datasource +
                ";Initial Catalog=" + database + "; Trusted_Connection=True;";


            Console.WriteLine(connString);

            SqlConnection conn = new SqlConnection(connString);

            try
            {
                Console.WriteLine("Opening Connection ...");
                // Open the connection
                conn.Open();
                Console.WriteLine("Connection successful!");
                //InsertStaff(conn);
                displayStaff(conn);

            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            finally
            {
                // Close the connection
                conn.Close();
            }


        }
        static void InsertStaff(SqlConnection conn)
        {
            Console.Write("Enter the Staff Name...");

            //string myname = "Sachin2";
            string myname = "Surendradf";
            int id = 2;
            string phone = "158448493";
            //string querry = "insert into testtable () values(@Myname)";
            string querry = "INSERT INTO  student_table1 VALUES (@id,@myname, @phone)";

            SqlCommand cm = new SqlCommand(querry, conn);
            cm.Parameters.AddWithValue("@myname", myname);
            cm.Parameters.AddWithValue("@id", id);
            cm.Parameters.AddWithValue("@phone", phone);
            int rows = cm.ExecuteNonQuery();
            if (rows > 0)
            {
                Console.WriteLine("Inseted recordsuccessfully");
            }


        }
        static void displayStaff(SqlConnection conn)
        {
            string query = "select * from student_table1";
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();
            Console.WriteLine("Staff :");
            while (reader.Read())
            {
                {
                    Console.WriteLine($"Name :{reader["student_id"]}");

                }
            }
        }
    }
} 

