using Newtonsoft.Json;
using QService.Class;
using QService.Entity;
using QService.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QService.Controllers
{
    [RoutePrefix("api/SelectTranshead")]
    public class SelectTransheadController : ApiController
    {
        KioskChulaiPadEntities db;
        
        public SelectTransheadController()
        {
            db = new KioskChulaiPadEntities();
        }

        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage SearchTransheadCon([FromBody] SelectTransheadModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        ObjectResult<q_expr_sel_kiosk_trans_all_ipad_Result> stored;
                        string curdate = !string.IsNullOrEmpty(param.cur_date) ? param.cur_date : DateTime.Now.ToString("yyyy-MM-dd");
                        int missappoint = param.misappoint_month_not_exceed > 0 ? param.misappoint_month_not_exceed : 6;
                        
                        if (!string.IsNullOrEmpty(param.hn) && string.IsNullOrEmpty(param.queue_no))
                        {
                            //edit column hn number for select data ex. "12/57" in db = "57000012"
                            string hnnumber = Helper.Utility.HNFormat(param.hn);
                            stored = db.q_expr_sel_kiosk_trans_all_ipad(hnnumber, param.queue_no, curdate, missappoint);
                        }
                        else if (string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                        {
                            stored = db.q_expr_sel_kiosk_trans_all_ipad(null, param.queue_no, curdate, missappoint);
                        }
                        else if (!string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                        {
                            string hnnumber = Helper.Utility.HNFormat(param.hn);
                            stored = db.q_expr_sel_kiosk_trans_all_ipad(hnnumber, param.queue_no, curdate, missappoint);
                        }
                        else
                        {
                            stored = null;
                        }
                        if (stored != null)
                        {
                            //edit column hn number for user ex. "12/57" in db = "57000012"
                            var res = (from x in stored.ToList()
                                       select new
                                       {
                                           slip_seq = x.slip_seq,
                                           hn_no = Helper.Utility.HNDisplay(x.hn_no),
                                           queue_no = x.queue_no,
                                           slip_dtm_time = x.slip_dtm_time,
                                           slip_dtm_date = x.slip_dtm_date,
                                           slip_type_flag = x.slip_type_flag,
                                           flag_choose_right = x.flag_choose_right,
                                           transdetail_appoint_seq = x.transdetail_appoint_seq,
                                           appoint_date = x.appoint_date,
                                           appoint_time_start = x.appoint_time_start,
                                           appoint_time_end = x.appoint_time_end,
                                           appoint_clinic_name = x.appoint_clinic_name,
                                           appoint_clinic_location = x.appoint_clinic_location,
                                           transdetail_missappoint_seq = x.transdetail_missappoint_seq,
                                           missappoint_date = x.missappoint_date,
                                           missappoint_time_start = x.missappoint_time_start,
                                           missappoint_time_end = x.missappoint_time_end,
                                           missappoint_clinic_name = x.missappoint_clinic_name,
                                           missappoint_clinic_location = x.missappoint_clinic_location,
                                           transdetail_clinic_choose_seq = x.transdetail_clinic_choose_seq,
                                           clinic_desc = x.clinic_desc,
                                           flag_clinic_quota_full = x.flag_clinic_quota_full
                                       });
                            HttpResponseMessage result = Request.CreateResponse(HttpStatusCode.OK, res.ToList());
                            return result;
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.BadRequest, "Not complete parameter !!");
                        }
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest, "No parameter send request !!");
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }
}
