using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Class
{
    public static class CallSoap
    {
        public static string GenQExpress(string slip_type_detail, string slip_type_flag,string location_desc,string crtd_by)
        {
            string result = "";
            GenQService.GenQueue ws = new GenQService.GenQueue();
            result = ws.GenNineQueue(slip_type_detail, slip_type_flag, location_desc,crtd_by);
            return result;
        }
    }
}
