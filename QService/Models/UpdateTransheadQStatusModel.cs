using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class UpdateTransheadQStatusModel
    {
        public int slip_seq { get; set; }/*xxx*/
        public string queue_status { get; set; }/*xxx*/
        public string last_chg_by { get; set; }/*xxx*/
    }
}
