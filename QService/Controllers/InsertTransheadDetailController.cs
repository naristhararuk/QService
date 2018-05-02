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
    [RoutePrefix("api/InsertTransheadDetail")]
    public class InsertTransheadDetailController : ApiController
    {
        KioskChulaiPadEntities db;

        public InsertTransheadDetailController()
        {
            db = new KioskChulaiPadEntities();
        }
        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage InsertTransheadDetailCon([FromBody] InsertTransheadDetailModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        db.q_expr_ins_kiosk_transdetail_right(param.slip_seq,param.right_group_code,param.right_group_name,param.right_code,param.right_name,param.contact_type,param.right_cont_code,param.right_cont_name,param.right_start_date,param.right_e_date,param.right_last_date, param.crtd_by);
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
