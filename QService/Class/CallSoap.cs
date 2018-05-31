using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QService.Class
{
    public static class CallSoap
    {
        //public static string GenQExpress(string slip_type_detail, string slip_type_flag,string location_desc,string crtd_by)
        //{
        //    string result = "";
        //    GenQService.GenQueue ws = new GenQService.GenQueue();
        //    result = ws.GenNineQueue(slip_type_detail, slip_type_flag, location_desc,crtd_by);
        //    return result;
        //}
        public static string GenQExpress(string p_slip_type_detail, string p_slip_type_flag, string p_kiosk_location_desc,string p_slip_no, string crtd_by)
        {
            QChulaService.WS_KioskQSoapClient ws = new QChulaService.WS_KioskQSoapClient();
            // เรียกเฉพาะคิว A หรือ J เร่งด่วน
            //DataSet dsQ = ws.CreateQ_NoHN
            //(
            //    "ipad"                                  // ใส่ค่า ipad ไปก่อนครับ
            //    , "5"                                   // ใช้เลข 5 เป็นคิวเร่งด่วน
            //    , "พยาบาลคัดแยกอาการตรวจสอบอาการด้วย ipad"    // นำมาจาก  kiosk_locat.locat_name (ใน store q_expr_sel_kiosk_com_cat_ipad)
            //    , "ipad"                                // ใส่ค่า ipad ไปก่อนครับ
            //    , "ipad01"                              // นำมาจาก kiosk_computer.com_name (ชื่อเดียวกันกับที่ login เข้ามาใน ipad)
            //);
            DataSet ds = ws.CreateQ_NoHN(p_slip_type_detail, p_slip_type_flag, p_kiosk_location_desc, p_slip_no, crtd_by);
            
            //ds.Tables[0].Rows[0]["Title"].ToString();
            string result = ds != null ? ds.Tables[0].Rows[0][0].ToString() : "";
            return result;
        }
    }
}
