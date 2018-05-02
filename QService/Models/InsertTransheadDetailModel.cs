using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class InsertTransheadDetailModel
    {
        public int slip_seq { get; set; }/*xxx*/
        public string right_group_code { get; set; }/*xxx*/
        public string right_group_name { get; set; }/*xxx*/
        public string right_code { get; set; }/*xxx*/
        public string right_name { get; set; }/*xxx*/
        public string contact_type { get; set; }/*xxx*/
        public string right_cont_code { get; set; }/*xxx*/
        public string right_cont_name { get; set; }/*xxx*/
        public DateTime right_start_date { get; set; }/*xxx*/
        public DateTime right_e_date { get; set; }/*xxx*/
        public DateTime right_last_date { get; set; }/*xxx*/
        public string crtd_by { get; set; }/*xxx*/
    }

}
