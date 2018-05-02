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
    [RoutePrefix("api/InsertQExpress")]
    public class InsertQExpressController : ApiController
    {
        KioskChulaiPadEntities db;

        public InsertQExpressController()
        {
            db = new KioskChulaiPadEntities();
        }

        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage InsertQExpressCon([FromBody] InsertQExpressModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        if (!string.IsNullOrEmpty(param.queue_no) && string.IsNullOrEmpty(param.flag_queue) && string.IsNullOrEmpty(param.q_action) && string.IsNullOrEmpty(param.crtd_by))
                        {
                            db.q_expr_ins_kiosk_qExpress_log_ipad(param.queue_no, param.flag_queue, param.q_action, param.crtd_by);

                            return Request.CreateResponse(HttpStatusCode.OK, "Insert Complete.");
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
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }
}
