using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class QueueModel
    {
        public string slip_type_detail { get; set; }
        public string slip_type_flag { get; set; }
        public string location_desc { get; set; }
        public string crtd_by { get; set; }
    }
    public class HNModel
    {
        public string hn_no { get; set; }
    }

    public class ChangeQueueModel
    {
        public string com_name { get; set; }
        public int slip_seq { get; set; }
        public string slip_type_detail { get; set; }
        public string slip_type_flag { get; set; }
        public string location_desc { get; set; }
        public string crtd_by { get; set; }
    }

    public class InsFlowGenQueueComModel
    {
        public string com_name { get; set; }
        public string building_code { get; set; }
        public string floor { get; set; }
        public string zone { get; set; }
        public string locat_code { get; set; }
        public string locat_name { get; set; }
        public string com_code { get; set; }
        public int computer_code { get; set; }
        public string kiosk_group_code { get; set; }


    }
}
