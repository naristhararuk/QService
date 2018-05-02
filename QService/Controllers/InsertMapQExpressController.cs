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
    [RoutePrefix("api/InsertMapQExpress")]
    public class InsertMapQExpressController : ApiController
    {
        KioskChulaiPadEntities db;

        public InsertMapQExpressController()
        {
            db = new KioskChulaiPadEntities();
        }

        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage InsertMapQExpressCon([FromBody] InsertMapQExpressModel param)
        {
            try
            {
                using (db)
                {
                    if (param != null)
                    {
                        if (!string.IsNullOrEmpty(param.queue_no_express) && !string.IsNullOrEmpty(param.queue_no_q) && !string.IsNullOrEmpty(param.active_flag) && !string.IsNullOrEmpty(param.crtd_by))
                        {
                            db.q_expr_ins_kiosk_map_qexpress_ipad(param.slip_seq_express, param.queue_no_express, param.slip_seq_q, param.queue_no_q, param.active_flag, param.crtd_by);
                           
                            return Request.CreateResponse(HttpStatusCode.OK, "Insert Complete.");
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.NotFound, "Not complete parameter !!");
                        }
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "No parameter send request !!");
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
