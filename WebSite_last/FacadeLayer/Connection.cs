using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FacadeLayer
{
    public class Connection
    {
        public static readonly SqlConnection connection = new SqlConnection("Server=NS;Database=Movie Corporation;Trusted_Connection=True;");
    }
}
