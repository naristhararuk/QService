using QService.Class;
using QService.Entity;
using QService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QService.Controllers
{
    [RoutePrefix("api/InsertTranshead")]
    public class InsertTransheadController : ApiController
    {
        KioskChulaiPadEntities db;

        public InsertTransheadController()
        {
            db = new KioskChulaiPadEntities();
        }
        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage InsertTransheadCon([FromBody] InsertTransheadModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        /*
                        string slip_type = param.slip_type != "" ? param.slip_type : "";
                        string slip_type_detail = param.slip_type_detail != "" ? param.slip_type_detail : "";
                        string slip_type_flag = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        DateTime register_date { get; set; }
                        //register_time time(7)
                        //out_time time(7)
                        string building_code = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string floor = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string zone = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string locat_code = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string locat_name = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string com_code = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        int computer_code = param.computer_code;
                        string computer_name = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string kiosk_group_code = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string time_type = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string idcard_no = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string hn_no = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string pateint_name = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        DateTime pateint_dob = param.pateint_dob != null ? param.pateint_dob : DateTime.Now;
                        string patient_file_location_type = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string patient_file_location_code = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string patient_file_location_name = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        DateTime patient_file_asof = param.patient_file_asof != null ? param.patient_file_asof : DateTime.Now;
                        string queue_no = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string flag_queue = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string queue_status = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string pateint_flag = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string flag_change_right = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string flag_choose_right = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string flag_remark_right = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string print_result = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        string crtd_by = param.slip_type_flag != "" ? param.slip_type_flag : "";
                        */
                        string hn = param.hn_no != "" ? Helper.Utility.HNFormat(param.hn_no) : "";
                        db.q_expr_ins_kiosk_transhead_ipad(param.slip_type, param.slip_type_detail, param.slip_type_flag, param.register_date,param.register_time.TimeOfDay,param.out_time.TimeOfDay,param.building_code,param.floor
                            ,param.zone,param.locat_code,param.locat_name,param.com_code,param.computer_code,param.computer_name,param.kiosk_group_code,param.time_type,param.idcard_no, hn, param.pateint_name,param.pateint_dob
                            ,param.patient_file_location_type,param.patient_file_location_code,param.patient_file_location_name,param.patient_file_asof,param.queue_no,param.flag_queue,param.queue_status,param.pateint_flag
                            ,param.flag_change_right,param.flag_choose_right,param.flag_remark_right,param.print_result,param.crtd_by);
                        return Request.CreateResponse(HttpStatusCode.OK, "Insert Complete.");
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest, "Parameter send request has problem!!");
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }
}
