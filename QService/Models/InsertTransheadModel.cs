using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class InsertTransheadModel
    {
        public string slip_type { get; set; }/*xxx*/
        public string slip_type_detail { get; set; }/*xxx*/
        public string slip_type_flag { get; set; }/*xxx*/
        public DateTime register_date { get; set; }/*xxx*/
        public DateTime register_time { get; set; }/*xxx*/
        public DateTime out_time { get; set; }/*xxx*/
        public string building_code { get; set; }/*xxx*/
        public string floor { get; set; }/*xxx*/
        public string zone { get; set; }/*xxx*/
        public string locat_code { get; set; }/*xxx*/
        public string locat_name { get; set; }/*xxx*/
        public string com_code { get; set; }/*xxx*/
        public int computer_code { get; set; }/*xxx*/
        public string computer_name { get; set; }/*xxx*/
        public string kiosk_group_code { get; set; }/*xxx*/
        public string time_type { get; set; }/*xxx*/
        public string idcard_no { get; set; }/*xxx*/
        public string hn_no { get; set; }/*xxx*/
        public string pateint_name { get; set; }/*xxx*/
        public DateTime pateint_dob { get; set; }/*xxx*/
        public string patient_file_location_type { get; set; }/*xxx*/
        public string patient_file_location_code { get; set; }/*xxx*/
        public string patient_file_location_name { get; set; }/*xxx*/
        public DateTime patient_file_asof { get; set; }/*xxx*/
        public string queue_no { get; set; }/*xxx*/
        public string flag_queue { get; set; }/*xxx*/
        public string queue_status { get; set; }/*xxx*/
        public string pateint_flag { get; set; }/*xxx*/
        public string flag_change_right { get; set; }/*xxx*/
        public string flag_choose_right { get; set; }/*xxx*/
        public string flag_remark_right { get; set; }/*xxx*/
        public string print_result { get; set; }/*xxx*/
        public string crtd_by { get; set; }/*xxx*/
    }
}
