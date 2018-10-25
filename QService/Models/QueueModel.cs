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
        public string p_slip_no { get; set; }
        public string crtd_by { get; set; }
    }
    public class QueueNineModel
    {
        public string channel_group_name { get; set; }
        public string q_no { get; set; }
        public string q_id { get; set; }
        public string ws_result { get; set; }
    }
    public class QueueExpressResultModel
    {
        public string patient_name { get; set; }
        public string queue_no { get; set; }
        public string queue_no_express { get; set; }
        public string hn_no { get; set; }
    }
    public class HNModel
    {
        public string hn_no { get; set; }
    }

    public class ChangeQueueModel
    {
        public string com_name { get; set; }
        public DateTime regis_date { get; set; }
        public int slip_seq { get; set; }
        public string slip_type_detail { get; set; }
        public string slip_type_flag { get; set; }
        public string slip_no { get; set; }
        /*===============================================================*/
        /*=====use for call service UpdateQ_ClickStatusQ_Nurse===========*/
        public string q_no { get; set; }
        public string q_status { get; set; }
        public string status_clinic_scanning { get; set; }
        public string status_send_clinic { get; set; }
        public string nurse_channel_comp_id { get; set; }
        public string status_voice_call { get; set; }
        /*===============================================================*/
        public string crtd_by { get; set; }
    }
    public class ChangeQueueNormalSoapModel
    {
        // กรณีเป็น คิว A, B, F ส่งตรวจแบบปกติ
        //DataSet dsABF = client.UpdateQ_ClickStatusQ_Nurse
        //(
        //      ""            // ส่ง slip_seq ที่ต้องการทำเป็นคิว A, B, F เร่งด่วน
        //    , "W"           // ผ่านพยาบาลคัดกรองแล้ว
        //    , "Y"           // Y = (ผ่านพยาบาลคัดกรองแล้ว)
        //    , "S"           // S = ส่งลงทะเบียนตรวจ
        //    , ""            // เว้นว่างไว้ครับ
        //    , "ipad01"      // นำมาจาก kiosk_computer.com_name (ชื่อเดียวกันกับที่ login เข้ามาใน ipad)
        //);
        public int q_no { get; set; }
        public int q_status { get; set; }
        public string status_clinic_scanning { get; set; }
        public string status_send_clinic { get; set; }
        public string nurse_channel_comp_id { get; set; }
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
    public class q_express_Result
    {
        public string qexpress { get; set; }
    }
}
