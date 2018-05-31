using QService.Class;
using QService.Entity;
using QService.Models;
using System;
using System.Data;
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
        #region SERVICE
        [Route("Post")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage Post([FromBody] ChangeQueueModel param)
        {
            

            List<InsFlowGenQueueComModel> inscom = SelectComKiosk(param.com_name);
            QueueNineModel qnine = GenQNine(param, inscom);

            return Request.CreateResponse(HttpStatusCode.OK, "qid:" + qnine.q_id+" qno:" +qnine.q_no+ " channel:" +qnine.channel_group_name);
        }

        [Route("GenQueue")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage GenQ9([FromBody] ChangeQueueModel param)
        {
            try
            {
                //string q9 = CallSoap.GenQExpress(param.slip_type_detail, param.slip_type_flag, param.location_desc, param.crtd_by);
                //res.Content = new StringContent(q9, System.Text.Encoding.UTF8);
                CUKioskService.WS_KioskQSoapClient ws = new CUKioskService.WS_KioskQSoapClient();
                DataSet ds = ws.CreateQ_NoHN("ipad", "5", "พยาบาลคัดแยกอาการตรวจสอบอาการด้วย ipad", "ipad", "ipad01");
                //QChulaService.WS_KioskQSoapClient ws = new QChulaService.WS_KioskQSoapClient();
                //DataSet ds = ws.CreateQ_NoHN(param.slip_type_detail, param.slip_type_flag, param.location_desc, param.p_slip_no, param.crtd_by);
                var result = ds.Tables[0].AsEnumerable().ToList();
                return Request.CreateResponse(HttpStatusCode.OK, result);
                //return Request.CreateResponse(HttpStatusCode.OK, "90002");
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
        public HttpResponseMessage GenQFlowNormal([FromBody] ChangeQueueModel param)
        {
            try
            {
                string slip_seq = param.slip_seq.ToString();
                bool updateqstatus = UpdateQ_ClickStatusQ_Nurse(param, slip_seq);
                if (updateqstatus)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "ส่งตรวจไปยังช่องบริการ 1-5 เรียบร้อย");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when call service StatusQ_Nurse !!");
                }
            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        [Route("GenQExpress")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage GenQFlowExpress([FromBody] ChangeQueueModel param)
        {
            try
            {
                /*====get location ipad for insert======*/
                //select db.q_expr_sel_kiosk_com_cat_ipad
                //========param computer_name = 'IPAD001'
                List<InsFlowGenQueueComModel> inscom = SelectComKiosk(param.com_name);
                List<QueueExpressResultModel> expressresult = new List<QueueExpressResultModel>();
                List<PatientTransheadModel> patient = SelectPatientTranshead(param.slip_seq);
                QueueExpressResultModel Models = new QueueExpressResultModel();
                List<kiosk_transhead> tranheadresult;
                /*====update queue status======*/
                //update db.q_expr_upd_kiosk_transhead_queue_status_ipad
                //========param queue_status = 'C' ,slip_seq  ,last_chg_by

                string updateresult = UpdateQueueStatus(param);
                if (updateresult == "true")
                {
                    /*====select patient info transhead ======*/
                                       
                    //gen queue 9
                    if (inscom.Count > 0 && patient.Count > 0)
                    {
                        QueueNineModel qnine = GenQNine(param, inscom);
                        string q9 = "";
                        if (qnine.ws_result != null && qnine.ws_result == "S")
                        {
                            q9 = qnine.q_no;
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when call express queue service !!");
                        }
                        //q9 = q9 != "" ? q9 : "9" + patient[0].queue_no;
                        
                        /*====insert transhead ======*/
                        //insert db.q_expr_ins_kiosk_transhead_ipad
                        //========param queue_status = 'C' ,slip_seq  ,last_chg_by
                        if (InsertTranshead(param, patient, inscom,q9))
                        {
                            tranheadresult = GetLastTransHead(param, patient, q9);

                            if (tranheadresult.Count > 0)
                            {
                                if (UpdateMapQueue(param, patient, tranheadresult, qnine))
                                {
                                    //insert db.q_expr_ins_kiosk_qExpress_log_ipad
                                    if (InsertLogQueue(param, patient, inscom, q9))
                                    {
                                        Models.queue_no = patient[0].queue_no;
                                        Models.queue_no_express = q9;
                                        Models.patient_name = patient[0].pateint_name;
                                        Models.hn_no = patient[0].hn_no;
                                        expressresult.Add(Models); //add to list

                                        //call service q 
                                        string slip_seq_new = tranheadresult[0].slip_seq.ToString();
                                        bool updateqstatus = UpdateQ_ClickStatusQ_Nurse(param, slip_seq_new);
                                        if (updateqstatus)
                                        {
                                            return Request.CreateResponse(HttpStatusCode.OK, q9);
                                        }
                                        else
                                        {
                                            return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when call service StatusQ_Nurse !!");
                                        }
                                    }
                                    else
                                    {
                                         return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when insert log queue !!");
                                    }
                                }
                                else
                                {
                                    return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when update map queue !!");
                                }
                            }
                            else
                            {
                                return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when select old transhead !!");
                            }
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when insert transhead !!");
                        }
                    }
                    else {
                        return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when select computer or device name !!");
                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "problem when update queue status !!" + updateresult);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message + ex.InnerException.Message);
            }
        }
        #endregion SERVICE

        #region METHOD
        private QueueNineModel GenQNine(ChangeQueueModel param, List<InsFlowGenQueueComModel> inscom)
        {
            /* Generate Q express from service Chula*/
            QueueNineModel queue = new QueueNineModel();
            //QChulaService.WS_KioskQSoapClient ws = new QChulaService.WS_KioskQSoapClient();
            CUKioskService.WS_KioskQSoapClient ws = new CUKioskService.WS_KioskQSoapClient();
            DataSet ds = ws.CreateQ_NoHN(param.slip_type_detail, param.slip_type_flag, inscom[0].locat_name, param.slip_no,param.crtd_by);
            if(ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                queue.channel_group_name = ds.Tables[0].Rows[0]["channel_group_id"].ToString();
                queue.q_no = ds.Tables[0].Rows[0]["q_no"].ToString();
                queue.q_id = ds.Tables[0].Rows[0]["q_id"].ToString();
                queue.ws_result = ds.Tables[0].Rows[0]["ws_result"].ToString();
            }
            return queue;
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
        private string UpdateQueueStatus(ChangeQueueModel param)
        {
            try
            {
                using (var context = new KioskChulaiPadEntities())
                {
                    if (param != null)
                    {
                        /* update old queue to "C" = Cancel */
                        context.q_expr_upd_kiosk_transhead_queue_status_ipad(param.slip_seq, "C", param.crtd_by);
                        return "true";
                    }
                    else
                    {
                        return "param null";
                    }
                }
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
        private List<PatientTransheadModel> SelectPatientTranshead(int slip_seq)
        {
            try {
                using (db)
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
                        Models.patient_flag = item.pateint_flag;
                        Models.pateint_service_flag = item.pateint_service_flag;
                        Models.queue_no = item.queue_no;
                        Models.flag_queue = item.flag_queue;
                        Models.queue_status = item.queue_status;
                        Models.flag_change_right = item.flag_change_right;
                        Models.flag_choose_right = item.flag_choose_right;
                        Models.flag_remark_right = item.flag_remark_right;
                        Models.print_result = item.print_result;
                        //string idcard = patient[0].idcard_no;
                        //string hn_no = patient[0].hn_no;
                        //string patientname = patient[0].pateint_name;
                        //DateTime? patientbirth = patient[0].pateint_dob;
                        //string patientfilelocationtype = patient[0].patient_file_location_type;
                        //string patientfilelocationcode = patient[0].patient_file_location_code;
                        //string patientfilelocationname = patient[0].patient_file_location_name;
                        //DateTime? patientfileasof = patient[0].patient_file_asof;
                        //string patientflag = patient[0].patient_flag;
                        //string queueno = patient[0].queue_no;
                        //string queueflag = patient[0].flag_queue;
                        //string queuestatus = patient[0].queue_status;
                        //string flagchangeright = patient[0].flag_change_right;
                        //string flagchooseright = patient[0].flag_choose_right;
                        //string flagremarkright = patient[0].flag_remark_right;
                        //string printresult = patient[0].print_result;


                        patientlist.Add(Models); //add to list
                    }
                    return patientlist;
                }
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        private bool InsertTranshead(ChangeQueueModel param, List<PatientTransheadModel> patient, List<InsFlowGenQueueComModel> inscom,string q9)
        {
            try
            {
                using (var context = new KioskChulaiPadEntities())
                {
                    if (param != null && patient !=null && inscom != null)
                    {
                        /* insert */
                        string sliptype = "Q";
                        string sliptypedetail = "12";
                        string sliptypeflag = "1";
                        DateTime? regisdate = param.regis_date.Date;
                        TimeSpan? registime = param.regis_date.TimeOfDay;
                        TimeSpan? outtime = DateTime.Now.TimeOfDay;
                        string buildingcode = inscom[0].building_code != null ? inscom[0].building_code : "";
                        string floor = inscom[0].floor != null ? inscom[0].floor : "";
                        string zone = inscom[0].zone != null ? inscom[0].zone : "" ;
                        string locatcode = inscom[0].locat_code != null ? inscom[0].locat_code : "";
                        string locatname = inscom[0].locat_name != null ? inscom[0].locat_name : "";
                        string comcode = inscom[0].com_code != null ? inscom[0].com_code : "";
                        int? computercode = inscom[0].computer_code;
                        string computername = inscom[0].com_name != null ? inscom[0].com_name : "";
                        string kioskgroupcode = inscom[0].kiosk_group_code != null ? inscom[0].kiosk_group_code : "";
                        string timetype = "I";
                        string idcard = patient[0].idcard_no;
                        string hn_no = patient[0].hn_no;
                        string patientname = patient[0].pateint_name;
                        DateTime? patientbirth = patient[0].pateint_dob;
                        string patientfilelocationtype = patient[0].patient_file_location_type;
                        string patientfilelocationcode = patient[0].patient_file_location_code;
                        string patientfilelocationname = patient[0].patient_file_location_name;
                        DateTime? patientfileasof = patient[0].patient_file_asof;
                        string patientflag = patient[0].patient_flag;
                        string queueno = q9;
                        string queueflag = patient[0].flag_queue;
                        string queuestatus = patient[0].queue_status;
                        string flagchangeright = patient[0].flag_change_right;
                        string flagchooseright = patient[0].flag_choose_right;
                        string flagremarkright = patient[0].flag_remark_right;
                        string printresult = patient[0].print_result;
                        string crdby = param.crtd_by;

                        context.q_expr_ins_kiosk_transhead_ipad(sliptype, sliptypedetail, sliptypeflag, regisdate, registime, outtime, buildingcode, floor, zone,
                            locatcode, locatname, comcode, computercode, computername, kioskgroupcode, timetype, idcard, hn_no, patientname, patientbirth, patientfilelocationtype,
                            patientfilelocationcode, patientfilelocationname, patientfileasof, queueno, queueflag, queuestatus, patientflag,
                            flagchangeright, flagchooseright, flagremarkright, printresult, crdby);
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
        private bool UpdateMapQueue(ChangeQueueModel param, List<PatientTransheadModel> patient, List<kiosk_transhead> tranheadresult, QueueNineModel q9)
        {
            try
            {
                using (var context = new KioskChulaiPadEntities())
                {
                    if (param != null && patient !=null && tranheadresult != null)
                    {
                        /* insert */
                        int slip_seq_express = tranheadresult[0].slip_seq;
                        string queue_no_express = q9.q_no;
                        int slip_seq_old = param.slip_seq;
                        string queue_no_old = patient[0].queue_no;
                        string activeflag = "Y";
                        string crdby = param.crtd_by;

                        context.q_expr_ins_kiosk_map_qexpress_ipad(slip_seq_express, queue_no_express, slip_seq_old, queue_no_old, activeflag, crdby);

                        /*update queue_id to service chula*/
                        //bool updateslipseq = UpdateQ_SlipSeq(q9.q_id, slip_seq_express.ToString());
                        
                        return UpdateQ_SlipSeq(q9.q_id, slip_seq_express.ToString());
                        

                        
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
        private bool UpdateQ_SlipSeq(string q_id, string slip_seq_express)
        {
            try {
                //QChulaService.WS_KioskQSoapClient ws = new QChulaService.WS_KioskQSoapClient();
                CUKioskService.WS_KioskQSoapClient ws = new CUKioskService.WS_KioskQSoapClient();
                ws.UpdateQ_SlipSeq(q_id, slip_seq_express);
                return true;
            }
            catch
            {
                return false;
            }
        }
        private bool InsertLogQueue(ChangeQueueModel param, List<PatientTransheadModel> patient, List<InsFlowGenQueueComModel> inscom, string q9)
        {
            try
            {
                using (var context = new KioskChulaiPadEntities())
                {
                    if (param != null)
                    {
                        string queue_no_old = patient[0].queue_no;
                        string flag_queue_old = "N";
                        string q_action_old = "C";
                       
                        string queue_no_express = q9;
                        string flag_queue_express = "E";
                        string q_action_express= "W";

                        string crdby = param.crtd_by;

                        /* insert log queue old*/
                        context.q_expr_ins_kiosk_qExpress_log_ipad(queue_no_old, flag_queue_old, q_action_old, crdby);
                        /* insert log queue express*/
                        context.q_expr_ins_kiosk_qExpress_log_ipad(queue_no_express, flag_queue_express, q_action_express, crdby);
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
        private List<kiosk_transhead> GetLastTransHead(ChangeQueueModel param, List<PatientTransheadModel> patient,string q9)
        {
            try
            {
                List<kiosk_transhead> tranheadresult;
                using (var context = new KioskChulaiPadEntities())
                {
                    if (param != null && patient != null )
                    {
                        /* select  */
                        DateTime? regisdate = param.regis_date.Date;
                        string hn_no = patient[0].hn_no;
                        
                        tranheadresult = (from val in context.kiosk_transhead
                                          where val.hn_no == hn_no && val.queue_no == q9
                                          && val.register_date == regisdate && val.queue_status != "C"
                                          select val).ToList();

                        return tranheadresult;
                    }
                    else
                    {
                        return new List<kiosk_transhead>();
                    }
                }
            }
            catch
            {
                return new List<kiosk_transhead>();
            }
        }
        private bool UpdateQ_ClickStatusQ_Nurse(ChangeQueueModel param,string slip_seq)
        {
            //UpdateQ_ClickStatusQ_Nurse
            /* Update Q normal/express to service Chula*/
            string result = "";
            CUKioskService.WS_KioskQSoapClient ws = new CUKioskService.WS_KioskQSoapClient();
            //QChulaService.WS_KioskQSoapClient ws = new QChulaService.WS_KioskQSoapClient();
            DataSet ds = ws.UpdateQ_ClickStatusQ_Nurse(slip_seq, param.q_status, param.status_clinic_scanning, param.status_send_clinic, param.nurse_channel_comp_id, param.crtd_by);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                result = ds.Tables[0].Rows[0]["ws_result"].ToString();
                if (result == "S")
                    return true;
                else return false;
            }
            else {
                return false;
            }
        }
        #endregion METHOD
    }
}
