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
        public string patient_flag { get; set; }
        public string pateint_service_flag { get; set; }
        public string queue_no { get; set; }
        public string queue_status { get; set; }
        public string flag_queue { get; set; }
        public int waiting_qno { get; set; }
        public DateTime time_gen_waiting_qno { get; set; }
        public string flag_change_right { get; set; }
        public string flag_choose_right { get; set; }
        public string flag_lab_xray { get; set; }
        public string flag_remark_right { get; set; }
        public string flag_remark_right_group2 { get; set; }
        public string flag_general_pateint { get; set; }
        public string flag_nosend_approve { get; set; }
        public string flag_have_right_approved { get; set; }
        public string flag_dct_ins_treatment_order { get; set; }
        public int q_channel_group_id { get; set; }
        public int q_period_no { get; set; }
        public string flag_print_q_report { get; set; }
        public DateTime print_q_report_last_dttm { get; set; }
        public string print_result { get; set; }
    }
}
