using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class InsertQExpressModel
    {
        public string queue_no { get; set; }
        public string flag_queue { get; set; }
        public string q_action { get; set; }
        public string crtd_by { get; set; }
    }
}
