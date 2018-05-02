using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Models
{
    public class SelectTransheadModel
    {
        public string hn { get; set; }                              /*เลขผู้ป่วย*/
        public string queue_no { get; set; }                        /*หมายเลขคิว*/
        public string cur_date { get; set; }                        /*วันที่สร้างคิว*/
        public int misappoint_month_not_exceed { get; set; }        /*จำนวนเดือนผิดนัดไม่เกิน*/
    }

    public class PatientTransheadModel
    {
        public string idcard_no { get; set; }                        /*หมายเลขคิว*/
        public string hn_no { get; set; }
        public string pateint_name { get; set; }
        public DateTime? pateint_dob { get; set; }
        public string patient_file_location_type { get; set; }
        public string patient_file_location_status { get; set; }
        public string patient_file_location_code { get; set; }
        public string patient_file_location_name { get; set; }
        public DateTime? patient_file_asof { get; set; }
        public string queue_no { get; set; }
    }
}
