//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QService.Entity
{
    using System;
    
    public partial class q_expr_sel_kiosk_trans_all_ipad_Result
    {
        public int slip_seq { get; set; }
        public string hn_no { get; set; }
        public string queue_no { get; set; }
        public string slip_dtm_time { get; set; }
        public Nullable<System.DateTime> slip_dtm_date { get; set; }
        public string slip_type_detail { get; set; }
        public string slip_type_flag { get; set; }
        public string slip_no { get; set; }
        public string flag_choose_right { get; set; }
        public string pateint_name { get; set; }
        public string right_fullname { get; set; }
        public Nullable<int> transdetail_appoint_seq { get; set; }
        public Nullable<System.DateTime> appoint_date { get; set; }
        public Nullable<System.TimeSpan> appoint_time_start { get; set; }
        public Nullable<System.TimeSpan> appoint_time_end { get; set; }
        public string appoint_clinic_name { get; set; }
        public string appoint_clinic_location { get; set; }
        public Nullable<int> transdetail_missappoint_seq { get; set; }
        public Nullable<System.DateTime> missappoint_date { get; set; }
        public Nullable<System.TimeSpan> missappoint_time_start { get; set; }
        public Nullable<System.TimeSpan> missappoint_time_end { get; set; }
        public string missappoint_clinic_name { get; set; }
        public string missappoint_clinic_location { get; set; }
        public Nullable<int> transdetail_clinic_choose_seq { get; set; }
        public string clinic_desc { get; set; }
        public string flag_clinic_quota_full { get; set; }
    }
}
