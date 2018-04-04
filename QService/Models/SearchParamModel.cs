using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class SearchParamModel
    {
        public string queue_no { get; set; }                         /*หมายเลขคิว*/
        public string hn { get; set; }                               /*เลขผู้ป่วย*/
    }
}
