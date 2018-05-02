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
    [RoutePrefix("api/UpdateQStatus")]
    public class UpdateTransheadQStatusController : ApiController
    {
        KioskChulaiPadEntities db;

        public UpdateTransheadQStatusController()
        {
            db = new KioskChulaiPadEntities();
        }
        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage UpdateTransheadQStatusCon([FromBody] UpdateTransheadQStatusModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        db.q_expr_upd_kiosk_transhead_queue_status_ipad(param.slip_seq,param.queue_status, param.last_chg_by);
                        return Request.CreateResponse(HttpStatusCode.OK, "Update Complete.");
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
