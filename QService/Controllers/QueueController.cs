using QService.Class;
using QService.Entity;
using QService.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace QService.Controllers
{
    [RoutePrefix("api/Queue")]
    public class QueueController : ApiController
    {
        KioskChulaiPadEntities db;

        public QueueController()
        {
            db = new KioskChulaiPadEntities();
        }
        //[HttpGet]
        //public IEnumerable<kiosk_transhead> GetQueue()
        //{
        //    using (db)
        //    {
        //        return db.kiosk_transhead.ToList();
        //    }
        //}

        [Route("GenQueue")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage GenQ9([FromBody] QueueModel param)
        {
            try
            {
                HttpResponseMessage res = Request.CreateResponse(HttpStatusCode.OK, "value");
                string q9 = CallSoap.GenQExpress(param.slip_type_detail,param.slip_type_flag,param.location_desc,param.crtd_by);
                res.Content = new StringContent(q9, System.Text.Encoding.UTF8);
                return res;
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        [Route("HN")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage HNDisplay([FromBody] string param)
        {
            try
            {
                HttpResponseMessage result = Request.CreateResponse(HttpStatusCode.OK, "value");
                string hn = Helper.Utility.HNDisplay(param);
                result.Content = new StringContent(hn, System.Text.Encoding.UTF8);
                return result;
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        [Route("GenQ")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage GenQFlow([FromBody] ChangeQueueModel param)
        {
            try
            {
                HttpResponseMessage res = Request.CreateResponse(HttpStatusCode.OK, "value");
                string q9 = CallSoap.GenQExpress(param.slip_type_detail, param.slip_type_flag, param.location_desc, param.crtd_by);
                
                //gen queue 9
                /*====get location ipad for insert======*/
                //select db.q_expr_sel_kiosk_com_cat_ipad
                //========param computer_name = 'IPAD001'
                List<InsFlowGenQueueComModel> inscom = SelectComKiosk(param.com_name);


                /*====update queue status======*/
                //update db.q_expr_upd_kiosk_transhead_queue_status_ipad
                //========param queue_status = 'C' ,slip_seq  ,last_chg_by
                if (UpdateQueueStatus(param))
                {

                    /*====select patient info transhead ======*/
                    List<PatientTransheadModel> patient = SelectPatientTranshead(param.slip_seq);
                    
                    /*====insert transhead ======*/
                    //insert db.q_expr_ins_kiosk_transhead_ipad
                    //========param queue_status = 'C' ,slip_seq  ,last_chg_by
                    
                    //insert db.q_expr_ins_kiosk_map_qexpress_ipad   /*slipseq ที่ได้จาก insert q_expr_ins_kiosk_transhead_ipad*/
                    //insert db.q_expr_ins_kiosk_qExpress_log_ipad
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when update queue status !!");
                }

                res.Content = new StringContent(q9, System.Text.Encoding.UTF8);
                return res;
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }



        private List<InsFlowGenQueueComModel> SelectComKiosk(string com_name)
        {
            ObjectResult<q_expr_sel_kiosk_com_cat_ipad_Result> result;
            result = db.q_expr_sel_kiosk_com_cat_ipad(com_name);
            List<InsFlowGenQueueComModel> comlist = new List<InsFlowGenQueueComModel>();
            foreach (var item in result)
            {
                InsFlowGenQueueComModel Models = new InsFlowGenQueueComModel();
                Models.com_name = com_name;
                Models.building_code = item.building_code;
                Models.floor = item.floor;
                Models.zone = item.zone;
                Models.locat_code = item.locat_code;
                Models.locat_name = item.locat_name;
                Models.com_code = item.com_code;
                Models.computer_code = item.computer_code;
                Models.kiosk_group_code = item.kiosk_group_code;
                comlist.Add(Models); //add to list
            }
            return comlist;
        }
        private bool UpdateQueueStatus(ChangeQueueModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        /* update old queue to "C" = Cancel */
                        db.q_expr_upd_kiosk_transhead_queue_status_ipad(param.slip_seq, "C", param.crtd_by);
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch 
            {
                return false;
            }
        }
        private List<PatientTransheadModel> SelectPatientTranshead(int slip_seq)
        {
            var result = (from x in db.kiosk_transhead
                          where x.slip_seq == slip_seq
                          select x
                          );
            List<PatientTransheadModel> patientlist = new List<PatientTransheadModel>(); ;
            foreach (var item in result)
            {
                PatientTransheadModel Models = new PatientTransheadModel();
                
                Models.idcard_no = item.idcard_no;
                Models.hn_no = item.hn_no;
                Models.pateint_name = item.pateint_name;
                Models.pateint_dob = item.pateint_dob;
                Models.patient_file_location_type = item.patient_file_location_type;
                Models.patient_file_location_status = item.patient_file_location_status;
                Models.patient_file_location_code = item.patient_file_location_code;
                Models.patient_file_location_name = item.patient_file_location_name;
                Models.patient_file_asof = item.patient_file_asof;
                Models.queue_no = item.queue_no;
                patientlist.Add(Models); //add to list
            }
            return patientlist;
        }
    }
}
