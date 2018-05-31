using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class InsertMapQExpressModel
    {
        public int slip_seq_express { get; set; }
        public string queue_no_express { get; set; }
        public int slip_seq_q { get; set; }
        public string queue_no_q { get; set; }
        public string active_flag { get; set; }
        public string crtd_by { get; set; }
    }
}
